import logging
import os
import yaml

import click
import looker_sdk

from looker_sdk import methods, models


logging.basicConfig(
    format="%(asctime)s %(levelname)-8s %(message)s",
    level=logging.INFO,
    datefmt="%Y-%m-%d %H:%M:%S",
)


def setup_sdk(client_id, client_secret, instance) -> methods.Looker31SDK:
    os.environ["LOOKERSDK_BASE_URL"] = instance
    os.environ["LOOKERSDK_API_VERSION"] = "3.1"
    os.environ["LOOKERSDK_VERIFY_SSL"] = "true"
    os.environ["LOOKERSDK_TIMEOUT"] = "120"
    os.environ["LOOKERSDK_CLIENT_ID"] = client_id
    os.environ["LOOKERSDK_CLIENT_SECRET"] = client_secret

    return looker_sdk.init31()


def sync_dashboards(sdk: methods.Looker31SDK, config: dict) -> None:
    for dashboard_id, lookml_dashboard_id in config.items():
        try:
            dashboard = sdk.dashboard(str(dashboard_id))
            sdk.dashboard_lookml(lookml_dashboard_id)
            sdk.update_dashboard(
                str(dashboard_id),
                models.WriteDashboard(lookml_link_id=lookml_dashboard_id),
            )

            sdk.sync_lookml_dashboard(lookml_dashboard_id, models.WriteDashboard())
            logging.info(
                f"Dashboard {dashboard_id} synced with LookML dashboard {lookml_dashboard_id}"
            )
        except looker_sdk.error.SDKError as e:
            logging.error(f"Dashboard {dashboard_id} dashboard sync failed with {e}")


def load_config(filename: str) -> dict:
    with open(filename) as f:
        config = yaml.load(f, Loader=yaml.SafeLoader)

    return config


@click.command()
@click.option("--client_id", envvar="LOOKER_API_CLIENT_ID", required=True)
@click.option("--client_secret", envvar="LOOKER_API_CLIENT_SECRET", required=True)
@click.option("--instance_uri", envvar="LOOKER_INSTANCE_URI", required=True)
@click.argument("config", type=click.Path(exists=True))
def main(client_id: str, client_secret: str, instance_uri: str, config: str):
    sdk = setup_sdk(client_id, client_secret, instance_uri)
    config = load_config(config)
    sync_dashboards(sdk, config)


if __name__ == "__main__":
    main()
