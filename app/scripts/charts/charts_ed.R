## Data and Charts for Education Indicator:

## ed_1_1_1 ----

ed_1_1_1 <- tibble::tribble(
                    ~vector,                       ~highest_certificate_diploma_or_degree, ~selected_demographic_characteristics,      ~sex,
              "v1140566345",                          "No certificate, diploma or degree",                      "25 to 64 years",   "Males",
              "v1140566409",                          "No certificate, diploma or degree",                      "25 to 64 years", "Females",
              "v1140566537", "Secondary (high) school diploma or equivalency certificate",                      "25 to 64 years",   "Males",
              "v1140566601", "Secondary (high) school diploma or equivalency certificate",                      "25 to 64 years", "Females",
              "v1140566729",               "Postsecondary certificate, diploma or degree",                      "25 to 64 years",   "Males",
              "v1140566793",               "Postsecondary certificate, diploma or degree",                      "25 to 64 years", "Females",
              "v1140572489",        "Postsecondary certificate, diploma or degree (STEM)",                      "25 to 64 years",   "Males",
              "v1140572553",        "Postsecondary certificate, diploma or degree (STEM)",                      "25 to 64 years", "Females",
              "v1140604169",    "Postsecondary certificate, diploma or degree (non-STEM)",                      "25 to 64 years",   "Males",
              "v1140604233",    "Postsecondary certificate, diploma or degree (non-STEM)",                      "25 to 64 years", "Females"
              ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>%
              clean_names() %>%
              select(vector, value, val_norm),
            by = "vector")

ed_1_1_1$highest_certificate_diploma_or_degree <-factor(ed_1_1_1$highest_certificate_diploma_or_degree,
                                                        levels = c("No certificate, diploma or degree",
                                                                   "Secondary (high) school diploma or equivalency certificate",
                                                                   "Postsecondary certificate, diploma or degree",
                                                                   "Postsecondary certificate, diploma or degree (STEM)",
                                                                   "Postsecondary certificate, diploma or degree (non-STEM)" ))

chart_ed_1_1_1 <- ggplot(ed_1_1_1, aes(y =  sex, x = value)) +
  geom_col() +
  geom_text(aes(label = value), hjust = 1.2, color = "white") +
  facet_wrap(facets = vars(highest_certificate_diploma_or_degree), ncol = 1, strip.position = "top") +
  labs(x = "Percent of persons aged 25 to 64",
       y = NULL, 
       title = "Highest level of education (% of total by gender)",
       caption = "Source: Statistics Canada table 37-10-0171-01\nReference date: 2016; Frequency: Every 5 years") +
  bcstats_chart_theme

## ed_1_1_3 ----

ed_1_1_3 <- tibble::tribble(
        ~vector,               ~geo,         ~sex,       ~age_group, ~selected_demographic_characteristics, ~secondary_high_school_diploma_or_equivalency_certificate,
  "v1139475588",           "Canada", "Both sexes", "25 to 64 years",                  "Total, all persons",                             "High school completion rate",
  "v1139475926",           "Canada",      "Males", "25 to 64 years",                  "Total, all persons",                             "High school completion rate",
  "v1139476264",           "Canada",    "Females", "25 to 64 years",                  "Total, all persons",                             "High school completion rate",
  "v1139516148", "British Columbia", "Both sexes", "25 to 64 years",                  "Total, all persons",                             "High school completion rate",
  "v1139516486", "British Columbia",      "Males", "25 to 64 years",                  "Total, all persons",                             "High school completion rate",
  "v1139516824", "British Columbia",    "Females", "25 to 64 years",                  "Total, all persons",                             "High school completion rate"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, val_norm),
            by = "vector") 

chart_ed_1_1_3 <- ggplot(ed_1_1_3, aes(y = sex, x = value)) +
  geom_col() +
  geom_text(aes(label = value), hjust = 1.2, color = "white") +
  facet_wrap(facets = vars(geo), ncol = 1, strip.position = "top") +
  labs(x = "Percent of persons aged 25 to 64",
       y = NULL, 
       title = "High school completion rate by gender (%)",
       caption = "Source: Statistics Canada table 37-10-0170-01\nReference date: 2016; Frequency: Every 5 years") +
  bcstats_chart_theme

## ed_1_3_1 ----

ed_1_3_1 <- tibble::tribble(
      ~vector, ~ref_date,               ~geo,         ~sex,         ~age_group,                                                         ~statistics,     ~skill,
  "v96441152",     2012L, "British Columbia", "Both sexes", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441155",     2012L, "British Columbia", "Both sexes", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441188",     2012L, "British Columbia",      "Males", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441191",     2012L, "British Columbia",      "Males", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441224",     2012L, "British Columbia",    "Females", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441227",     2012L, "British Columbia",    "Females", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Numeracy"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, val_norm),
            by = "vector") 

chart_ed_1_3_1 <- ggplot(ed_1_3_1, aes(y = sex, x = value)) +
  geom_col() +
  geom_text(aes(label = value), hjust = 1.2, color = "white") +
  facet_wrap(facets = vars(skill), ncol = 1, strip.position = "top") +
  labs(x = "Percent of persons aged 16 to 65",
       y = NULL, 
       title = "Proficiency in skill at level 3 or above (%)",
       caption = "Source: Statistics Canada table 37-10-0047-01\nReference date: 2012; Frequency: Occasional") +
  bcstats_chart_theme

  
