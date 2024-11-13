include: "../views/shredder_per_job_stats.view.lkml"

explore: shredder_job_stats {
  from: shredder_per_job_stats
}
