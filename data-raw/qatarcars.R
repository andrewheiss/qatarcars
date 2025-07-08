library(tidyverse)
library(haven)

# Download and clean data ----

uri_qatarcars <- "https://github.com/profmusgrave/qatarcars/raw/refs/heads/main/qatarcars.dta"

qatarcars_df <- haven::read_dta(uri_qatarcars) |> 
  mutate(across(where(is.labelled), \(x) haven::as_factor(x))) |> 
  mutate(across(where(is.character), as.factor)) |> 
  as.data.frame()

# Add data to the package ----
# usethis::use_data(qatarcars, overwrite = TRUE)
usethis::use_data(qatarcars_df, internal = TRUE, overwrite = TRUE)
saveRDS(qatarcars_df, here::here("inst", "extdata", "qatarcars.rds"))
