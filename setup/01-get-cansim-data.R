## Get/format cansim data for app

## Libraries ----
library(tidyverse)
library(cansim)
library(janitor)
library(lubridate)
library(qs)

## Setup data list ----

data <- list()

# to remove an element
##data<- within(data, rm(pov_5_5_1))


# Education ----

## ed_1_1_1 ----
## Proportion of Females in each education group -> cleveland: yaxis = highest_certificate_diploma_or_degree

ed_1_1_1 <- tibble::tribble(
        ~vector,                       ~highest_certificate_diploma_or_degree, ~selected_demographic_characteristics,      ~sex,
  "v1140566409",                          "No certificate, diploma or degree",                      "25 to 64 years", "Females",
  "v1140566601", "Secondary (high) school diploma or equivalency certificate",                      "25 to 64 years", "Females",
  "v1140566793",               "Postsecondary certificate, diploma or degree",                      "25 to 64 years", "Females",
  "v1140572553",        "Postsecondary certificate, diploma or degree (STEM)",                      "25 to 64 years", "Females",
  "v1140604233",    "Postsecondary certificate, diploma or degree (non-STEM)",                      "25 to 64 years", "Females"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>%
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

ed_1_1_1$highest_certificate_diploma_or_degree <-factor(ed_1_1_1$highest_certificate_diploma_or_degree,
                                                        levels = c("Postsecondary certificate, diploma or degree (non-STEM)",
                                                                   "Postsecondary certificate, diploma or degree (STEM)",
                                                                   "Postsecondary certificate, diploma or degree",
                                                                   "Secondary (high) school diploma or equivalency certificate",
                                                                   "No certificate, diploma or degree"))
data <- data %>% append(list("ed_1_1_1" = ed_1_1_1))

## ed_1_1_3 ----
## highschool completion rate by demog 
## rate by gender for each demog group -> cleveland_chart_duo: yaxis = selected_demographic_characteristics

ed_1_1_3 <- tibble::tribble(
        ~vector,               ~geo,      ~sex,                              ~age_group, ~selected_demographic_characteristics, ~secondary_high_school_diploma_or_equivalency_certificate,
  "v1139516382", "British Columbia",   "Males", "Total, persons aged 15 years and over",                  "Total, all persons",                             "High school completion rate",
  "v1139516384", "British Columbia",   "Males", "Total, persons aged 15 years and over",                          "Immigrants",                             "High school completion rate",
  "v1139516385", "British Columbia",   "Males", "Total, persons aged 15 years and over",             "Non-permanent residents",                             "High school completion rate",
  "v1139516386", "British Columbia",   "Males", "Total, persons aged 15 years and over",   "Total visible minority population",                             "High school completion rate",
  "v1139516400", "British Columbia",   "Males", "Total, persons aged 15 years and over",           "Total Aboriginal identity",                             "High school completion rate",
  "v1139516720", "British Columbia", "Females", "Total, persons aged 15 years and over",                  "Total, all persons",                             "High school completion rate",
  "v1139516722", "British Columbia", "Females", "Total, persons aged 15 years and over",                          "Immigrants",                             "High school completion rate",
  "v1139516723", "British Columbia", "Females", "Total, persons aged 15 years and over",             "Non-permanent residents",                             "High school completion rate",
  "v1139516724", "British Columbia", "Females", "Total, persons aged 15 years and over",   "Total visible minority population",                             "High school completion rate",
  "v1139516738", "British Columbia", "Females", "Total, persons aged 15 years and over",           "Total Aboriginal identity",                             "High school completion rate"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

data<- data %>% append(list("ed_1_1_3" = ed_1_1_3))

## ed_1_3_1 ----
## Adult numeracy and literacy
## % of pop by gender/age -> cleveland_chart_duo: yaxis = age_group; facets = numeracy/literacy

ed_1_3_1 <- tibble::tribble(
      ~vector,               ~geo,      ~sex,         ~age_group,                                                         ~statistics,     ~skill,
  "v96441188", "British Columbia",   "Males", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441191", "British Columbia",   "Males", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441194", "British Columbia",   "Males",   "16 to 24 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441197", "British Columbia",   "Males",   "16 to 24 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441200", "British Columbia",   "Males",   "25 to 34 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441203", "British Columbia",   "Males",   "25 to 34 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441206", "British Columbia",   "Males",   "35 to 44 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441209", "British Columbia",   "Males",   "35 to 44 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441212", "British Columbia",   "Males",   "45 to 54 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441215", "British Columbia",   "Males",   "45 to 54 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441218", "British Columbia",   "Males",   "55 to 65 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441221", "British Columbia",   "Males",   "55 to 65 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441224", "British Columbia", "Females", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441227", "British Columbia", "Females", "Total age groups", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441230", "British Columbia", "Females",   "16 to 24 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441233", "British Columbia", "Females",   "16 to 24 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441236", "British Columbia", "Females",   "25 to 34 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441239", "British Columbia", "Females",   "25 to 34 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441242", "British Columbia", "Females",   "35 to 44 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441245", "British Columbia", "Females",   "35 to 44 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441248", "British Columbia", "Females",   "45 to 54 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441251", "British Columbia", "Females",   "45 to 54 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy",
  "v96441254", "British Columbia", "Females",   "55 to 65 years", "Percent of the population scoring at proficiency level 3 or above", "Literacy",
  "v96441257", "British Columbia", "Females",   "55 to 65 years", "Percent of the population scoring at proficiency level 3 or above", "Numeracy"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

ed_1_3_1$age_group <- factor(ed_1_3_1$age_group, 
                             levels = c("55 to 65 years", "45 to 54 years", "35 to 44 years", "25 to 34 years", "16 to 24 years", "Total age groups" ))

data <- data %>% append(list("ed_1_3_1" = ed_1_3_1))

# Economics ----

## econ_2_1_1 ----
## Labour Market
# unemployment, participation, employment rates by gender -> cleveland_duo: yaxis = labour_force_characteristics

econ_2_1_1 <- tibble::tribble(
        ~vector,               ~geo,      ~sex,          ~age_group, ~labour_force_characteristics,
  "v1063549746", "British Columbia",   "Males", "15 years and over",           "Unemployment rate",
  "v1063549768", "British Columbia", "Females", "15 years and over",           "Unemployment rate",
  "v1063549812", "British Columbia",   "Males", "15 years and over",          "Participation rate",
  "v1063549834", "British Columbia", "Females", "15 years and over",          "Participation rate",
  "v1063549878", "British Columbia",   "Males", "15 years and over",             "Employment rate",
  "v1063549900", "British Columbia", "Females", "15 years and over",             "Employment rate"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector")

data <- data %>% append(list("econ_2_1_1" = econ_2_1_1))

## econ_2_2_1 ----
## Median hourly wage 
## Line chart over 5 or 10 years? facets by noc?

econ_2_2_1 <- tibble::tribble(
        ~vector,               ~geo,      ~sex,          ~age_group, ~classification_code_for_national_occupational_classification_noc,                                         ~national_occupational_classification_noc,                        ~type_of_work,                    ~wages,
  "v1063732599", "British Columbia",   "Males", "15 years and over",                                                             "[0]",                                                      "Management occupations [0]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732603", "British Columbia", "Females", "15 years and over",                                                             "[0]",                                                      "Management occupations [0]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732659", "British Columbia",   "Males", "15 years and over",                                                             "[1]",                            "Business, finance and administration occupations [1]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732663", "British Columbia", "Females", "15 years and over",                                                             "[1]",                            "Business, finance and administration occupations [1]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732731", "British Columbia",   "Males", "15 years and over",                                                             "[2]",                        "Natural and applied sciences and related occupations [2]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732735", "British Columbia", "Females", "15 years and over",                                                             "[2]",                        "Natural and applied sciences and related occupations [2]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732767", "British Columbia",   "Males", "15 years and over",                                                             "[3]",                                                          "Health occupations [3]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732771", "British Columbia", "Females", "15 years and over",                                                             "[3]",                                                          "Health occupations [3]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732827", "British Columbia",   "Males", "15 years and over",                                                             "[4]", "Occupations in education, law and social, community and government services [4]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732831", "British Columbia", "Females", "15 years and over",                                                             "[4]", "Occupations in education, law and social, community and government services [4]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732899", "British Columbia",   "Males", "15 years and over",                                                             "[5]",                           "Occupations in art, culture, recreation and sport [5]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732903", "British Columbia", "Females", "15 years and over",                                                             "[5]",                           "Occupations in art, culture, recreation and sport [5]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732935", "British Columbia",   "Males", "15 years and over",                                                             "[6]",                                               "Sales and service occupations [6]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063732939", "British Columbia", "Females", "15 years and over",                                                             "[6]",                                               "Sales and service occupations [6]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733019", "British Columbia",   "Males", "15 years and over",                                                             "[7]",           "Trades, transport and equipment operators and related occupations [7]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733023", "British Columbia", "Females", "15 years and over",                                                             "[7]",           "Trades, transport and equipment operators and related occupations [7]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733091", "British Columbia",   "Males", "15 years and over",                                                             "[8]",           "Natural resources, agriculture and related production occupations [8]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733095", "British Columbia", "Females", "15 years and over",                                                             "[8]",           "Natural resources, agriculture and related production occupations [8]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733139", "British Columbia",   "Males", "15 years and over",                                                             "[9]",                                  "Occupations in manufacturing and utilities [9]", "Both full- and part-time employees", "Median hourly wage rate",
  "v1063733143", "British Columbia", "Females", "15 years and over",                                                             "[9]",                                  "Occupations in manufacturing and utilities [9]", "Both full- and part-time employees", "Median hourly wage rate"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector, periods = 10) %>% 
              clean_names() %>%
              select(vector, ref_date, value),
            by = "vector") %>%
  select(-vector) %>%
  pivot_wider(names_from = sex, values_from = value) %>%
  mutate(diff = Males - Females,
         ref_date = ymd(ref_date)) %>%
  arrange(desc(diff))

econ_2_2_1$national_occupational_classification_noc <- factor(
  econ_2_2_1$national_occupational_classification_noc,
  levels = econ_2_2_1$national_occupational_classification_noc  %>% unique()
)

data <- data %>% append(list("econ_2_2_1" = econ_2_2_1))

## econ_2_3_1 ----
## full-time employment
## % of gender by age_group employed full-time -> cleveland duo: yaxis = age_group

econ_2_3_1 <-tibble::tribble(
        ~vector,               ~geo,      ~sex,          ~age_group,   ~labour_force_characteristics,
  "v1063549944", "British Columbia",   "Males", "15 years and over", "Proportion employed full-time",
  "v1063549945", "British Columbia",   "Males",    "15 to 24 years", "Proportion employed full-time",
  "v1063549947", "British Columbia",   "Males",    "25 to 44 years", "Proportion employed full-time",
  "v1063549965", "British Columbia",   "Males",    "45 to 64 years", "Proportion employed full-time",
  "v1063549962", "British Columbia",   "Males", "65 years and over", "Proportion employed full-time",
  "v1063549966", "British Columbia", "Females", "15 years and over", "Proportion employed full-time",
  "v1063549967", "British Columbia", "Females",    "15 to 24 years", "Proportion employed full-time",
  "v1063549969", "British Columbia", "Females",    "25 to 44 years", "Proportion employed full-time",
  "v1063549987", "British Columbia", "Females",    "45 to 64 years", "Proportion employed full-time",
  "v1063549984", "British Columbia", "Females", "65 years and over", "Proportion employed full-time"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

econ_2_3_1$age_group <- factor(econ_2_3_1$age_group,
                               levels = c("65 years and over", "45 to 64 years",
                                          "25 to 44 years", "15 to 24 years",
                                          "15 years and over"))


data <- data %>% append(list("econ_2_3_1" = econ_2_3_1))


## econ_2_4_1 ----
## daily time spent doing domestic care
## proportion of day spent on activity by gender -> cleveland_duo: yaxis = activity_group

econ_2_4_1 <-tibble::tribble(
        ~vector,               ~geo,     ~sex,                 ~age_group,                             ~activity_group,                     ~statistics,
  "v1061441853", "British Columbia",   "Male", "Total, 15 years and over",                    "Unpaid work activities", "Proportion of day, population",
  "v1061441855", "British Columbia", "Female", "Total, 15 years and over",                    "Unpaid work activities", "Proportion of day, population",
  "v1061441901", "British Columbia",   "Male", "Total, 15 years and over",                          "Household chores", "Proportion of day, population",
  "v1061441903", "British Columbia", "Female", "Total, 15 years and over",                          "Household chores", "Proportion of day, population",
  "v1061441949", "British Columbia",   "Male", "Total, 15 years and over", "Care of household children under 18 years", "Proportion of day, population",
  "v1061441951", "British Columbia", "Female", "Total, 15 years and over", "Care of household children under 18 years", "Proportion of day, population",
  "v1061441997", "British Columbia",   "Male", "Total, 15 years and over",                  "Care of household adults", "Proportion of day, population",
  "v1061441999", "British Columbia", "Female", "Total, 15 years and over",                  "Care of household adults", "Proportion of day, population",
  "v1061442045", "British Columbia",   "Male", "Total, 15 years and over",            "Shopping for goods or services", "Proportion of day, population",
  "v1061442047", "British Columbia", "Female", "Total, 15 years and over",            "Shopping for goods or services", "Proportion of day, population"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector")  %>%
  filter(!is.na(value)) 

econ_2_4_1$activity_group <- factor(econ_2_4_1$activity_group,
                                    levels = c("Care of household children under 18 years",
                                                "Shopping for goods or services",
                                              "Household chores",
                                              "Unpaid work activities"))

data <- data %>% append(list("econ_2_4_1" = econ_2_4_1))

## econ_2_5_1 ----
## proportion of occupation group that is women -> cleveland: yaxis = national_occupational_classification_noc

econ_2_5_1 <- tibble::tribble(
        ~vector,               ~geo,      ~sex, ~classification_code_for_national_occupational_classification_noc,                                     ~national_occupational_classification_noc, ~labour_force_characteristics,
  "v1063561687", "British Columbia", "Females",                                                             "[0]",                                                      "Management occupations",    "Proportion of employment",
  "v1063561702", "British Columbia", "Females",                                                             "[1]",                            "Business, finance and administration occupations",    "Proportion of employment",
  "v1063561720", "British Columbia", "Females",                                                             "[2]",                        "Natural and applied sciences and related occupations",    "Proportion of employment",
  "v1063561729", "British Columbia", "Females",                                                             "[3]",                                                          "Health occupations",    "Proportion of employment",
  "v1063561744", "British Columbia", "Females",                                                             "[4]", "Occupations in education, law and social, community and government services",    "Proportion of employment",
  "v1063561762", "British Columbia", "Females",                                                             "[5]",                           "Occupations in art, culture, recreation and sport",    "Proportion of employment",
  "v1063561771", "British Columbia", "Females",                                                             "[6]",                                               "Sales and service occupations",    "Proportion of employment",
  "v1063561792", "British Columbia", "Females",                                                             "[7]",           "Trades, transport and equipment operators and related occupations",    "Proportion of employment",
  "v1063561810", "British Columbia", "Females",                                                             "[8]",           "Natural resources, agriculture and related production occupations",    "Proportion of employment",
  "v1063561822", "British Columbia", "Females",                                                             "[9]",                                  "Occupations in manufacturing and utilities",    "Proportion of employment"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

data <- data %>% append(list("econ_2_5_1" = econ_2_5_1))


# Leadership ----

## lead_3_1_1 ----
## Proportion of women in management positions
## cleveland; yaxis = National Occupational Classification

# Frequency: Annual 
# Table: 14-10-0335-01
# Reference Date: 2020

lead_3_1_1 <- tibble::tribble(
                      ~vector,               ~geo,      ~sex, ~classification_code_for_national_occupational_classification_noc,                                           ~national_occupational_classification_noc, ~labour_force_characteristics,
                "v1063561687", "British Columbia", "Females",                                                             "[0]",                                                            "Management occupations",    "Proportion of employment",
                "v1063561690", "British Columbia", "Females",                                                            "[00]",                                                     "Senior management occupations",    "Proportion of employment",
                "v1063561693", "British Columbia", "Females",                                                         "[01-05]",                                         "Specialized middle management occupations",    "Proportion of employment",
                "v1063561696", "British Columbia", "Females",                                                            "[06]", "Middle management occupations in retail and wholesale trade and customer services",    "Proportion of employment",
                "v1063561699", "British Columbia", "Females",                                                         "[07-09]", "Middle management occupations in trades, transportation, production and utilities",    "Proportion of employment"
                )  %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

lead_3_1_1$national_occupational_classification_noc <- factor(lead_3_1_1$national_occupational_classification_noc,
                                                              levels = c("Middle management occupations in trades, transportation, production and utilities",
                                                                         "Middle management occupations in retail and wholesale trade and customer services",
                                                                         "Specialized middle management occupations",
                                                                         "Senior management occupations",
                                                                         "Management occupations"))
data <- data %>% append(list("lead_3_1_1" = lead_3_1_1))

## lead_3_2_1 ----
## proportion of businesses majority-owned by women by business size
## prop_bar: yaxis = firm_size; fill = gender_of_ownership

# Frequency: Occasional
# Table: 33-10-0191-01
# Reference date = 2013

lead_3_2_1 <- tibble::tribble(
                      ~vector,               ~geo, ~gender_of_ownership,              ~firm_size,    ~variable,
                "v1047597090", "British Columbia",          "Men-owned",       "Total firm size", "Percentage",
                "v1047597092", "British Columbia",          "Men-owned",            "0 employee", "Percentage",
                "v1047597094", "British Columbia",          "Men-owned",      "1 to 9 employees", "Percentage",
                "v1047597096", "British Columbia",          "Men-owned",    "10 to 19 employees", "Percentage",
                "v1047597098", "British Columbia",          "Men-owned",    "20 to 49 employees", "Percentage",
                "v1047597100", "British Columbia",          "Men-owned",    "50 to 99 employees", "Percentage",
                "v1047597102", "British Columbia",          "Men-owned", "100 or more employees", "Percentage",
                "v1047597104", "British Columbia",        "Women-owned",       "Total firm size", "Percentage",
                "v1047597106", "British Columbia",        "Women-owned",            "0 employee", "Percentage",
                "v1047597108", "British Columbia",        "Women-owned",      "1 to 9 employees", "Percentage",
                "v1047597110", "British Columbia",        "Women-owned",    "10 to 19 employees", "Percentage",
                "v1047597112", "British Columbia",        "Women-owned",    "20 to 49 employees", "Percentage",
                "v1047597114", "British Columbia",        "Women-owned",    "50 to 99 employees", "Percentage",
                "v1047597116", "British Columbia",        "Women-owned", "100 or more employees", "Percentage",
                "v1047597118", "British Columbia",      "Equally-owned",       "Total firm size", "Percentage",
                "v1047597120", "British Columbia",      "Equally-owned",            "0 employee", "Percentage",
                "v1047597122", "British Columbia",      "Equally-owned",      "1 to 9 employees", "Percentage",
                "v1047597124", "British Columbia",      "Equally-owned",    "10 to 19 employees", "Percentage",
                "v1047597126", "British Columbia",      "Equally-owned",    "20 to 49 employees", "Percentage",
                "v1047597128", "British Columbia",      "Equally-owned",    "50 to 99 employees", "Percentage",
                "v1047597130", "British Columbia",      "Equally-owned", "100 or more employees", "Percentage"
                ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

lead_3_2_1$firm_size <- factor(lead_3_2_1$firm_size,
                               levels = c("100 or more employees",
                                          "50 to 99 employees",
                                          "20 to 49 employees",
                                          "10 to 19 employees",
                                          "1 to 9 employees",
                                          "0 employee",
                                          "Total firm size"))

lead_3_2_1$gender_of_ownership <- factor(lead_3_2_1$gender_of_ownership,
                                         levels = c("Men-owned", "Women-owned", "Equally-owned"))

data <- data %>% append(list("lead_3_2_1" = lead_3_2_1))

## Justice ----

## just_4_2_1 ----
## proportion of pop self-reported assault by gender/demog
# Frequency: Every 5 years 
# Table: 35-10-0166-01
# ref date: 2018

## cleveland duo: yaxis = selected_demographic_characteristics

just_4_2_1 <- tibble::tribble(
                      ~vector,               ~geo,         ~gender, ~selected_demographic_characteristics,  ~statistics,
                "v1205964131", "British Columbia",   "Male gender",                    "Total population", "Percentage",
                "v1205964135", "British Columbia", "Female gender",                    "Total population", "Percentage",
                "v1205964259", "British Columbia",   "Male gender",                          "Immigrants", "Percentage",
                "v1205964263", "British Columbia", "Female gender",                          "Immigrants", "Percentage",
                "v1205964307", "British Columbia",   "Male gender",         "Visible minority population", "Percentage",
                "v1205964311", "British Columbia", "Female gender",         "Visible minority population", "Percentage",
                "v1205964371", "British Columbia",   "Male gender",                 "Indigenous identity", "Percentage",
                "v1205964375", "British Columbia", "Female gender",                 "Indigenous identity", "Percentage",
                "v1205964499", "British Columbia",   "Male gender",                    "Has a disability", "Percentage",
                "v1205964503", "British Columbia", "Female gender",                    "Has a disability", "Percentage",
                "v1205964563", "British Columbia",   "Male gender",                     "Sexual minority", "Percentage",
                "v1205964567", "British Columbia", "Female gender",                     "Sexual minority", "Percentage"
                ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

just_4_2_1$selected_demographic_characteristics <- factor(just_4_2_1$selected_demographic_characteristics,
                                                          levels = c("Sexual minority",
                                                                     "Has a disability",
                                                                     "Indigenous identity",
                                                                     "Visible minority population",
                                                                     "Immigrants",
                                                                     "Total population" ))

data <- data %>% append(list("just_4_2_1" = just_4_2_1))

## just_4_3_1 ----
## childhood maltreatment
# Frequency: Every 5 years# 
# Table: 35-10-0167-01
# ref date = 2018

## cleveland duo: yaxis = selected_demographic_characteristics
just_4_3_1 <- tibble::tribble(
        ~vector,               ~geo,         ~gender, ~type_of_childhood_maltreatment, ~selected_demographic_characteristics,  ~statistics,
  "v1206187756", "British Columbia",   "Male gender",      "Physical or sexual abuse",                    "Total population", "Percentage",
  "v1206187760", "British Columbia", "Female gender",      "Physical or sexual abuse",                    "Total population", "Percentage",
  "v1206187884", "British Columbia",   "Male gender",      "Physical or sexual abuse",                          "Immigrants", "Percentage",
  "v1206187888", "British Columbia", "Female gender",      "Physical or sexual abuse",                          "Immigrants", "Percentage",
  "v1206187932", "British Columbia",   "Male gender",      "Physical or sexual abuse",         "Visible minority population", "Percentage",
  "v1206187936", "British Columbia", "Female gender",      "Physical or sexual abuse",         "Visible minority population", "Percentage",
  "v1206188108", "British Columbia",   "Male gender",      "Physical or sexual abuse",                    "Has a disability", "Percentage",
  "v1206188112", "British Columbia", "Female gender",      "Physical or sexual abuse",                    "Has a disability", "Percentage",
  "v1206188172", "British Columbia",   "Male gender",      "Physical or sexual abuse",                     "Sexual minority", "Percentage",
  "v1206188176", "British Columbia", "Female gender",      "Physical or sexual abuse",                     "Sexual minority", "Percentage"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

just_4_3_1$selected_demographic_characteristics <- factor(just_4_3_1$selected_demographic_characteristics,
                                                          levels = c("Sexual minority",
                                                                     "Has a disability",
                                                                     "Visible minority population",
                                                                     "Immigrants",
                                                                     "Total population" ))

data <- data %>% append(list("just_4_3_1" = just_4_3_1))


## just_4_6_1 ----
## indigenous women subjected to violence
# Frequency: Every 5 years 
# Table: 35-10-0168-01
# ref date: 2018

## cleveland duo facet: yaxis = indigenous identity; facet = type_of_victimization

just_4_6_1 <- tibble::tribble(
  ~vector,               ~geo,         ~gender,                 ~type_of_victimization,      ~indigenous_identity,  ~statistics,
  "v1205970163", "British Columbia",   "Male gender",   "Sexual assault since the age of 15",     "Indigenous identity", "Percentage",
  "v1205970167", "British Columbia", "Female gender",   "Sexual assault since the age of 15",     "Indigenous identity", "Percentage",
  "v1205970243", "British Columbia",   "Male gender",   "Sexual assault since the age of 15", "Non-Indigenous identity", "Percentage",
  "v1205970247", "British Columbia", "Female gender",   "Sexual assault since the age of 15", "Non-Indigenous identity", "Percentage",
  "v1205970291", "British Columbia",   "Male gender", "Physical assault since the age of 15",     "Indigenous identity", "Percentage",
  "v1205970295", "British Columbia", "Female gender", "Physical assault since the age of 15",     "Indigenous identity", "Percentage",
  "v1205970371", "British Columbia",   "Male gender", "Physical assault since the age of 15", "Non-Indigenous identity", "Percentage",
  "v1205970375", "British Columbia", "Female gender", "Physical assault since the age of 15", "Non-Indigenous identity", "Percentage"
) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

data <- data %>% append(list("just_4_6_1" = just_4_6_1))

## Poverty ----

## pov_5_2_1 ----
## food security by family type
# Frequency: Occasional
# Table: 13-10-0385-01
# ref date: 2017/18
## prop_bar: yaxis = living_arrangement; fill = household_food_security_status

pov_5_2_1 <- tibble::tribble(
                        ~vector,               ~geo,                                         ~living_arrangement,      ~household_food_security_status,                ~statistics,
                  "v1059423854", "British Columbia",                            "Total, all living arrangements",                        "Food secure", "Percentage of households",
                  "v1138739253", "British Columbia",                            "Total, all living arrangements",            "Food insecure, marginal", "Percentage of households",
                  "v1059423860", "British Columbia",                            "Total, all living arrangements", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423866", "British Columbia",                            "Total, all living arrangements",            "Food insecure, moderate", "Percentage of households",
                  "v1059423872", "British Columbia",                            "Total, all living arrangements",              "Food insecure, severe", "Percentage of households",
                  "v1059423878", "British Columbia",                                       "Female living alone",                        "Food secure", "Percentage of households",
                  "v1138739261", "British Columbia",                                       "Female living alone",            "Food insecure, marginal", "Percentage of households",
                  "v1059423884", "British Columbia",                                       "Female living alone", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423890", "British Columbia",                                       "Female living alone",            "Food insecure, moderate", "Percentage of households",
                  "v1059423896", "British Columbia",                                       "Female living alone",              "Food insecure, severe", "Percentage of households",
                  "v1059423902", "British Columbia",                                         "Male living alone",                        "Food secure", "Percentage of households",
                  "v1138739269", "British Columbia",                                         "Male living alone",            "Food insecure, marginal", "Percentage of households",
                  "v1059423908", "British Columbia",                                         "Male living alone", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423914", "British Columbia",                                         "Male living alone",            "Food insecure, moderate", "Percentage of households",
                  "v1059423920", "British Columbia",                                         "Male living alone",              "Food insecure, severe", "Percentage of households",
                  "v1059423926", "British Columbia",                                        "Couple no children",                        "Food secure", "Percentage of households",
                  "v1138739277", "British Columbia",                                        "Couple no children",            "Food insecure, marginal", "Percentage of households",
                  "v1059423932", "British Columbia",                                        "Couple no children", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423938", "British Columbia",                                        "Couple no children",            "Food insecure, moderate", "Percentage of households",
                  "v1059423944", "British Columbia",                                        "Couple no children",              "Food insecure, severe", "Percentage of households",
                  "v1059423950", "British Columbia",             "Couple with child(ren) less than 18 years old",                        "Food secure", "Percentage of households",
                  "v1138739285", "British Columbia",             "Couple with child(ren) less than 18 years old",            "Food insecure, marginal", "Percentage of households",
                  "v1059423956", "British Columbia",             "Couple with child(ren) less than 18 years old", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423962", "British Columbia",             "Couple with child(ren) less than 18 years old",            "Food insecure, moderate", "Percentage of households",
                  "v1059423968", "British Columbia",             "Couple with child(ren) less than 18 years old",              "Food insecure, severe", "Percentage of households",
                  "v1059423974", "British Columbia", "Female lone parent with child(ren) less than 18 years old",                        "Food secure", "Percentage of households",
                  "v1138739293", "British Columbia", "Female lone parent with child(ren) less than 18 years old",            "Food insecure, marginal", "Percentage of households",
                  "v1059423980", "British Columbia", "Female lone parent with child(ren) less than 18 years old", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059423986", "British Columbia", "Female lone parent with child(ren) less than 18 years old",            "Food insecure, moderate", "Percentage of households",
                  "v1059423992", "British Columbia", "Female lone parent with child(ren) less than 18 years old",              "Food insecure, severe", "Percentage of households",
                  "v1059423998", "British Columbia",   "Male lone parent with child(ren) less than 18 years old",                        "Food secure", "Percentage of households",
                  "v1138739301", "British Columbia",   "Male lone parent with child(ren) less than 18 years old",            "Food insecure, marginal", "Percentage of households",
                  "v1059424004", "British Columbia",   "Male lone parent with child(ren) less than 18 years old", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059424010", "British Columbia",   "Male lone parent with child(ren) less than 18 years old",            "Food insecure, moderate", "Percentage of households",
                  "v1059424016", "British Columbia",   "Male lone parent with child(ren) less than 18 years old",              "Food insecure, severe", "Percentage of households",
                  "v1059424022", "British Columbia",                                 "Other living arrangements",                        "Food secure", "Percentage of households",
                  "v1138739309", "British Columbia",                                 "Other living arrangements",            "Food insecure, marginal", "Percentage of households",
                  "v1059424028", "British Columbia",                                 "Other living arrangements", "Food insecure, moderate and severe", "Percentage of households",
                  "v1059424034", "British Columbia",                                 "Other living arrangements",            "Food insecure, moderate", "Percentage of households",
                  "v1059424040", "British Columbia",                                 "Other living arrangements",              "Food insecure, severe", "Percentage of households"
                  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

pov_5_2_1$living_arrangement <- factor(pov_5_2_1$living_arrangement,
                                       levels = c("Other living arrangements",
                                                  "Male lone parent with child(ren) less than 18 years old",
                                                  "Female lone parent with child(ren) less than 18 years old",
                                                  "Male living alone",
                                                  "Female living alone",
                                                  "Couple with child(ren) less than 18 years old",
                                                  "Couple no children",
                                                  "Total, all living arrangements"))

data <- data %>% append(list("pov_5_2_1" = pov_5_2_1))



## pov_5_3_1 ----
## pop in core housing need by family type
# Frequency: Every 5 years
# Table: 39-10-0050-01
# ref date: 2016

## cleveland duo with facet: yaxis = selected_demographic_characteristics, facet = economic_family_structure

pov_5_3_1 <- tibble::tribble(
                         ~vector,               ~geo,      ~sex,          ~economic_family_structure, ~selected_demographic_characteristics,                ~core_housing_need_statistics,
                   "v1229709133", "British Columbia",   "Males",      "Persons in economic families",          "Total, all characteristics", "Percentage of persons in core housing need",
                   "v1229709140", "British Columbia",   "Males",      "Persons in economic families",                   "65 years and over", "Percentage of persons in core housing need",
                   "v1229709142", "British Columbia",   "Males",      "Persons in economic families",                          "Immigrants", "Percentage of persons in core housing need",
                   "v1229709146", "British Columbia",   "Males",      "Persons in economic families",   "Total visible minority population", "Percentage of persons in core housing need",
                   "v1229709160", "British Columbia",   "Males",      "Persons in economic families",           "Total Aboriginal identity", "Percentage of persons in core housing need",
                   "v1229709168", "British Columbia", "Females",      "Persons in economic families",          "Total, all characteristics", "Percentage of persons in core housing need",
                   "v1229709175", "British Columbia", "Females",      "Persons in economic families",                   "65 years and over", "Percentage of persons in core housing need",
                   "v1229709177", "British Columbia", "Females",      "Persons in economic families",                          "Immigrants", "Percentage of persons in core housing need",
                   "v1229709181", "British Columbia", "Females",      "Persons in economic families",   "Total visible minority population", "Percentage of persons in core housing need",
                   "v1229709195", "British Columbia", "Females",      "Persons in economic families",           "Total Aboriginal identity", "Percentage of persons in core housing need",
                   "v1229710643", "British Columbia",   "Males", "Persons not in an economic family",          "Total, all characteristics", "Percentage of persons in core housing need",
                   "v1229710651", "British Columbia",   "Males", "Persons not in an economic family",                   "65 years and over", "Percentage of persons in core housing need",
                   "v1229710653", "British Columbia",   "Males", "Persons not in an economic family",                          "Immigrants", "Percentage of persons in core housing need",
                   "v1229710657", "British Columbia",   "Males", "Persons not in an economic family",   "Total visible minority population", "Percentage of persons in core housing need",
                   "v1229710671", "British Columbia",   "Males", "Persons not in an economic family",           "Total Aboriginal identity", "Percentage of persons in core housing need",
                   "v1229710679", "British Columbia", "Females", "Persons not in an economic family",          "Total, all characteristics", "Percentage of persons in core housing need",
                   "v1229710687", "British Columbia", "Females", "Persons not in an economic family",                   "65 years and over", "Percentage of persons in core housing need",
                   "v1229710689", "British Columbia", "Females", "Persons not in an economic family",                          "Immigrants", "Percentage of persons in core housing need",
                   "v1229710693", "British Columbia", "Females", "Persons not in an economic family",   "Total visible minority population", "Percentage of persons in core housing need",
                   "v1229710707", "British Columbia", "Females", "Persons not in an economic family",           "Total Aboriginal identity", "Percentage of persons in core housing need"
                   ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

data <- data %>% append(list("pov_5_3_1" = pov_5_3_1))

## pov_5_5_1 ----
## leading causes of death
# Frequency: Annual
# Table: 13-10-0800-01
# ref date: 2019
## clevland_duo yaxis = cause_of_death_icd_10, value = proportion of total for each cause

pov_5_5_1 <- tibble::tribble(
       ~vector,                                   ~geo,      ~sex,                                                                    ~cause_of_death_icd_10,   ~characteristics,
  "v110578605", "British Columbia, place of residence",   "Males",                                                              "Total, all causes of death", "Number of deaths",
  "v110578621", "British Columbia, place of residence",   "Males",                                                                     "Malignant neoplasms", "Number of deaths",
  "v110578645", "British Columbia, place of residence",   "Males",                                                                       "Diabetes mellitus", "Number of deaths",
  "v110578651", "British Columbia, place of residence",   "Males",                                                                     "Alzheimer's disease", "Number of deaths",
  "v110578652", "British Columbia, place of residence",   "Males",                                                           "Major cardiovascular diseases", "Number of deaths",
  "v110578675", "British Columbia, place of residence",   "Males",                                                                 "Influenza and pneumonia", "Number of deaths",
  "v110578681", "British Columbia, place of residence",   "Males",                                                      "Chronic lower respiratory diseases", "Number of deaths",
  "v110578692", "British Columbia, place of residence",   "Males",                                                     "Chronic liver disease and cirrhosis", "Number of deaths",
  "v110578705", "British Columbia, place of residence",   "Males", "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified", "Number of deaths",
  "v110578706", "British Columbia, place of residence",   "Males",                                                           "All other diseases (residual)", "Number of deaths",
  "v110578707", "British Columbia, place of residence",   "Males",                                                      "Accidents (unintentional injuries)", "Number of deaths",
  "v110578730", "British Columbia, place of residence", "Females",                                                              "Total, all causes of death", "Number of deaths",
  "v110578746", "British Columbia, place of residence", "Females",                                                                     "Malignant neoplasms", "Number of deaths",
  "v110578772", "British Columbia, place of residence", "Females",                                                                       "Diabetes mellitus", "Number of deaths",
  "v110578778", "British Columbia, place of residence", "Females",                                                                     "Alzheimer's disease", "Number of deaths",
  "v110578779", "British Columbia, place of residence", "Females",                                                           "Major cardiovascular diseases", "Number of deaths",
  "v110578802", "British Columbia, place of residence", "Females",                                                                 "Influenza and pneumonia", "Number of deaths",
  "v110578808", "British Columbia, place of residence", "Females",                                                      "Chronic lower respiratory diseases", "Number of deaths",
  "v110578819", "British Columbia, place of residence", "Females",                                                     "Chronic liver disease and cirrhosis", "Number of deaths",
  "v110578835", "British Columbia, place of residence", "Females", "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified", "Number of deaths",
  "v110578836", "British Columbia, place of residence", "Females",                                                           "All other diseases (residual)", "Number of deaths",
  "v110578837", "British Columbia, place of residence", "Females",                                                      "Accidents (unintentional injuries)", "Number of deaths"
  ) %>%
  left_join(get_cansim_vector_for_latest_periods(vectors = .$vector) %>% 
              clean_names() %>%
              select(vector, value, ref_date),
            by = "vector") 

totals <- pov_5_5_1 %>%
  filter(str_detect(cause_of_death_icd_10, "Total")) %>% select(sex, total = value)

pov_5_5_1 <- pov_5_5_1 %>% left_join(totals, by = "sex") %>%
  mutate(perc = round_half_up(100*value/total, digits = 1),
         cause_of_death_icd_10 = ifelse(cause_of_death_icd_10 == "Symptoms, signs and abnormal clinical and laboratory findings, not elsewhere classified", 
                                        "Symptoms, signs and abnormal clinical and laboratory findings", cause_of_death_icd_10)) %>%
  filter(perc != 100) %>%
  rename(count = value,
         value= perc)

pov_5_5_1$cause_of_death_icd_10 <- factor(pov_5_5_1$cause_of_death_icd_10,
                                          levels = c("Chronic liver disease and cirrhosis",
                                                     "Influenza and pneumonia",
                                                     "Alzheimer's disease",
                                                     "Diabetes mellitus",
                                                     "Accidents (unintentional injuries)",
                                                     "Chronic lower respiratory diseases",
                                                     "Symptoms, signs and abnormal clinical and laboratory findings",
                                                     "All other diseases (residual)" ,
                                                     "Major cardiovascular diseases",
                                                     "Malignant neoplasms",
                                                     "Total, all causes of death"))  ## get levels from causes in find-cansim-data.R

data <- data %>% append(list("pov_5_5_1" = pov_5_5_1))






# Save data as RDS ----
names(data) ## check that all dataframes saved
qsave(data,"app/data/data.qs")




