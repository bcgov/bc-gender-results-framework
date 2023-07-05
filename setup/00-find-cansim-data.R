# Copyright 2019 Province of British Columbia
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
# http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

## ed_1_1_3 ----
## highschool completion rate by demog 
## rate by gender for each demog group -> cleveland_chart_duo: yaxis = selected_demographic_characteristics
test <- get_cansim("37-10-0170-01") %>%
  clean_names()

test_bc <- test %>% 
  filter(age_group == "Total, persons aged 15 years and over") %>% 
  filter(geo == "British Columbia") %>%
  filter(sex != "Both sexes") %>%
  filter(selected_demographic_characteristics %in% c("Total, all persons", "Immigrants", 
                                                     "Total visible minority population",
                                                     "Non-permanent residents",
                                                     "Total Aboriginal identity")) %>%
  filter(secondary_high_school_diploma_or_equivalency_certificate == "High school completion rate") %>%
  select(vector, geo, sex, age_group, selected_demographic_characteristics, secondary_high_school_diploma_or_equivalency_certificate)

write_csv(test_bc, here::here("sandbox","test2.csv"))

## ed_1_3_1 ----
## Adult numeracy and literacy
## % of pop by gender/age -> cleveland_chart_duo: yaxis = age_group; facets = numeracy/literacy
test <- get_cansim("37-10-0047-01") %>%
  clean_names()

test_bc <- test %>%
 # filter(age_group == "Total age groups") %>% ## 16 - 65
  filter(geo == "British Columbia") %>%
  filter(str_detect(statistics, "level 3") ) %>%
  filter(sex != "Both sexes") %>%
  select(vector, geo, sex, age_group, statistics, skill)

write_csv(test_bc, here::here("sandbox","test3.csv"))

## econ_2_1_1 ----
## Labour Market
# unemployment, participation, employment rates by gender -> cleveland_duo: yaxis = labour_force_characteristics

test <- get_cansim("14-10-0327-02") %>% clean_names()

test_bc <- test %>%
  filter(age_group == "15 years and over") %>% 
  filter(geo == "British Columbia") %>%
  filter(str_detect(labour_force_characteristics, "rate")) %>%
  filter(sex != "Both sexes") %>%
  select(vector,geo, sex, age_group, labour_force_characteristics) %>% unique()

write_csv(test_bc, here::here("sandbox","test4.csv"))

## econ_2_2_1 ----
## Median hourly wage 
## Line chart over 5 or 10 years? facets by noc?
test <- get_cansim("14-10-0340-01") %>% clean_names()

test_bc <-  test %>%
  filter(age_group == "15 years and over") %>% 
  filter(geo == "British Columbia") %>%
  filter(sex != "Both sexes") %>%
  filter(str_detect(classification_code_for_national_occupational_classification_noc, "[:punct:][:digit:]{1}[:punct:]")) %>%
  filter(type_of_work == "Both full- and part-time employees") %>%
  filter(wages == "Median hourly wage rate") %>%
  select(vector, geo, sex, age_group, classification_code_for_national_occupational_classification_noc,
         national_occupational_classification_noc,
         type_of_work,wages) %>%
  unique()

write_csv(test_bc, here::here("sandbox","test5.csv"))

## econ_2_3_1 ----
## full-time employment
## % of gender by age_group employed full-time -> cleveland duo: yaxis = age_group
test <- get_cansim("14-10-0327-01") %>% clean_names()

test_bc <-  test %>%
  filter(age_group %in% c("15 years and over", "15 to 24 years", "25 to 44 years", "45 to 64 years", "65 years and over")) %>% 
  filter(geo == "British Columbia") %>%
  filter(sex != "Both sexes") %>%
  filter(labour_force_characteristics %in% c("Proportion employed full-time")) %>%
  select(vector, geo, sex, age_group, labour_force_characteristics) %>%
  unique()

write_csv(test_bc, here::here("sandbox","test6.csv"))

## econ_2_4_1 ----
## daily time spent doing domestic care
## proportion of day spent on activity by gender -> cleveland_duo: yaxis = activity_group

test <- get_cansim("45-10-0014-02") %>% clean_names()

test_bc <-  test %>%
  filter(age_group == "Total, 15 years and over") %>% 
  filter(geo == "British Columbia") %>%
  filter(sex != "Both sexes") %>%
  filter(statistics == "Proportion of day, population") %>%
  filter(str_detect(hierarchy_for_activity_group, "11")) %>%
  select(vector, geo, sex, age_group, activity_group, statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test7.csv"), delim = ",")

## econ_2_5_1 ----
## proportion of occupation group that is women -> cleveland: yaxis = national_occupational_classification_noc

test <- get_cansim("14-10-0335-02") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(sex == "Females") %>%
  filter(labour_force_characteristics == "Proportion of employment") %>%
  filter(str_detect(classification_code_for_national_occupational_classification_noc, "[:punct:][:digit:]{1}[:punct:]")) %>%
  mutate(national_occupational_classification_noc = 
           str_remove_all(national_occupational_classification_noc," [:punct:][:digit:]{1}[:punct:]")) %>%
  select(vector, geo, sex, classification_code_for_national_occupational_classification_noc,
         national_occupational_classification_noc,
         labour_force_characteristics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test8.csv"), delim = ",")

# Leadership ----

## lead_3_1_1 ----
## Proportion of women in management positions
## cleveland; yaxis = National Occupational Classification

# Frequency: Annual 
# Table: 14-10-0335-01
# Reference Date: 2020

test <- get_cansim("14-10-0335-03") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(sex == "Females") %>%
  filter(labour_force_characteristics == "Proportion of employment") %>%
  filter(str_detect(classification_code_for_national_occupational_classification_noc, "[:punct:]0")) %>%
  mutate(national_occupational_classification_noc =
           str_remove_all(national_occupational_classification_noc," [:punct:]([:digit:]+-[:digit:]+|[:digit:]+)[:punct:]{1}")) %>%
  select(vector, geo, sex, classification_code_for_national_occupational_classification_noc,
         national_occupational_classification_noc,
         labour_force_characteristics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test9.csv"), delim = ",")


## lead_3_2_1 ----
## proportion of businesses majority-owned by women by business size
## prop_bar: yaxis = firm_size; group = gender_of_ownership

# Frequency: Occasional
# Table: 33-10-0191-01
# Reference date = 2013

test <- get_cansim("33-10-0191-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(gender_of_ownership != "Total gender") %>%
  filter(variable == "Percentage") %>%
  select(vector, geo, gender_of_ownership, firm_size, variable) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test10.csv"), delim = ",")

## Justice ----

## just_4_2_1 ----
## proportion of pop self-reported assault by gender/demog
# Frequency: Every 5 years 
# Table: 35-10-0166-01
# ref date: 2018

## cleveland duo: yaxis = selected_demographic_characteristics

test <- get_cansim("35-10-0166-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(gender %in% c("Male gender", "Female gender")) %>%
  filter(statistics == "Percentage") %>%
  filter(selected_demographic_characteristics %in% c("Total, age",
                                                     "Immigrants",
                                                     "Visible minority population",
                                                     "Indigenous identity",
                                                     "Has a disability",
                                                     "Sexual minority")) %>%
  mutate(selected_demographic_characteristics = fct_recode(selected_demographic_characteristics, "Total population" = "Total, age")) %>%
  select(vector, geo, gender, selected_demographic_characteristics, statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test11.csv"), delim = ",")

## just_4_3_1 ----
## childhood maltreatment
# Frequency: Every 5 years# 
# Table: 35-10-0167-01
# ref date = 2018

## cleveland duo: yaxis = selected_demographic_characteristics

test <- get_cansim("35-10-0167-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(gender %in% c("Male gender", "Female gender")) %>%
  filter(statistics == "Percentage") %>%
  filter(type_of_childhood_maltreatment == "Physical or sexual abuse") %>%
  filter(selected_demographic_characteristics %in% c("Total, age",
                                                     "Immigrants",
                                                     "Visible minority population",
                                                     "Indigenous identity",
                                                     "Has a disability",
                                                     "Sexual minority")) %>%
  mutate(selected_demographic_characteristics = fct_recode(selected_demographic_characteristics, "Total population" = "Total, age")) %>%
  select(vector, geo, gender, type_of_childhood_maltreatment, selected_demographic_characteristics, statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test12.csv"), delim = ",")


## just_4_6_1 ----
## indigenous women subjected to violence
# Frequency: Every 5 years 
# Table: 35-10-0168-01
# ref date: 2018

## cleveland duo facet: yaxis = indigenous identity; facet = type_of_victimization

test <- get_cansim("35-10-0168-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(gender %in% c("Male gender", "Female gender")) %>%
  filter(statistics == "Percentage") %>%
  filter(type_of_victimization != "Physical or sexual assault since the age of 15") %>%
  filter(indigenous_identity %in% c("Indigenous identity","Non-Indigenous identity")) %>%
  select(vector, geo, gender, type_of_victimization, indigenous_identity, statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test13.csv"), delim = ",")

## Poverty ----

## pov_5_2_1 ----
## food security by family type
# Frequency: Occasional
# Table: 13-10-0385-01
# ref date: 2017/18
## prop_bar: yaxis = living_arrangement; group = household_food_security_status

test <- get_cansim("13-10-0385-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(statistics == "Percentage of households") %>%
  select(vector, geo, living_arrangement, household_food_security_status, statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test14.csv"), delim = ",")

## pov_5_3_1 ----
## pop in core housing need by family type
# Frequency: Every 5 years
# Table: 39-10-0050-01
# ref date: 2016

## cleveland duo with facet: yaxis = selected_demographic_characteristics, facet = economic_family_structure

test <- get_cansim("39-10-0050-01") %>% clean_names()

test_bc<- test %>%
  filter(geo == "British Columbia") %>%
  filter(core_housing_need_statistics == "Percentage of persons in core housing need") %>%
  filter(sex != "Both sexes") %>%
  filter(economic_family_structure %in% c("Persons in economic families", "Persons not in an economic family")) %>%
  filter(selected_demographic_characteristics %in% c("Total, all characteristics",
                                                     "65 years and over",
                                                     "Immigrants",
                                                     "Total visible minority population",
                                                     "Total Aboriginal identity")) %>%
  select(vector, geo, sex,  economic_family_structure, selected_demographic_characteristics, core_housing_need_statistics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test15.csv"), delim = ",")

## pov_5_5_1 ----
## leading causes of death
# Frequency: Annual
# Table: 13-10-0800-01
# ref date: 2019
## clevland_duo yaxis = cause_of_death_icd_10, value = proportion of total for each cause

test <- get_cansim("13-10-0800-01") %>% clean_names()

## top ten causes of death
causes <- test %>%
  filter(str_detect(geo, "British Columbia")) %>%
  filter(characteristics == "Number of deaths") %>%
  filter(ref_date == max(ref_date)) %>%
  filter(sex == "Both sexes") %>%
  filter(str_count(hierarchy_for_cause_of_death_icd_10, "\\.") == 1) %>% ## Only top level diseases, excluding total
  arrange(desc(value)) %>%
  head(10) %>%
  pull(cause_of_death_icd_10) %>%
  as.character()


test_bc<- test %>%
  filter(str_detect(geo, "British Columbia")) %>%
  filter(characteristics == "Number of deaths") %>%
  filter(cause_of_death_icd_10 %in% c("Total, all causes of death [A00-Y89]", causes)) %>%
  filter(sex != "Both sexes") %>%
  mutate(cause_of_death_icd_10 = str_remove_all(cause_of_death_icd_10, "[:punct:][:alpha:]{1}[:digit:]+.*")) %>%
  select(vector, geo, sex,  cause_of_death_icd_10, characteristics) %>%
  unique()

vroom::vroom_write(test_bc, here::here("sandbox","test16.csv"), delim = ",")


## pov_5_5_2 ----
## health adjusted life expectancy


## pov_5_5_3 ----
## proportion of pop participated regularly in sport

## pov_5_6_1 ----
## proportion of adults who have high psychological well-being

## pov_5_7_1 ----
## proportion of "not trying to conceive" population that did not use contraception 

## pov_5_7_2 ----
## adolescent birth rate



