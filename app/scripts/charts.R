
# Education ----

## ed_1_1_1 ----

chart_ed_1_1_1 <- (ggplot(cansim_data$ed_1_1_1, aes(x = value, y = highest_certificate_diploma_or_degree)) +
  labs(x = "Percent female",
       y = NULL, 
       title = "Proportion of females in each highest level of education group",
       caption = "Source: Statistics Canada table 37-10-0171-01\nReference date: 2016; Frequency: Every 5 years")) %>%
  cleveland_chart(data = cansim_data$ed_1_1_1,
                  yaxis = highest_certificate_diploma_or_degree, 
                 label = paste0(value, "%"))


## ed_1_1_3 ----

chart_ed_1_1_3 <- (ggplot(cansim_data$ed_1_1_3, aes(x = value, y = selected_demographic_characteristics)) +
  labs(x = "Percent of persons aged 25 to 64",
       y = NULL, 
       title = "High school completion rate by gender (%)",
       caption = "Source: Statistics Canada table 37-10-0170-01\nReference date: 2016; Frequency: Every 5 years"
       )) %>%
  cleveland_chart_duo(data = cansim_data$ed_1_1_3,
                      yaxis = selected_demographic_characteristics,
                      label = paste0(value, "%"),
                      shape = sex)

## ed_1_3_1 ----

chart_ed_1_3_1 <- (ggplot(cansim_data$ed_1_3_1, aes(x = value, y = age_group)) +
  labs(x = "Percent of persons aged 16 to 65",
       y = NULL, 
       title = "Proficiency in skill at level 3 or above (%)",
       caption = "Source: Statistics Canada table 37-10-0047-01\nReference date: 2012; Frequency: Occasional") ) %>%
  cleveland_chart_duo_facet(data = cansim_data$ed_1_3_1,
                      yaxis = age_group,
                      label = paste0(value, "%"),
                      shape = sex,
                      facet = skill)

# Economics ----

## econ_2_1_1 ----

chart_econ_2_1_1 <- (ggplot(cansim_data$econ_2_1_1, aes(x = value, y = labour_force_characteristics )) +
  labs(x = "Rate for persons aged 15 years and over",
       y = NULL, 
       title = "Labour market characteristics by gender (rate)",
       caption = "Source: Statistics Canada table 14-10-0327-02\nReference date: 2020; Frequency: Annual")) %>%
  cleveland_chart_duo(data = cansim_data$econ_2_1_1,
                      yaxis = labour_force_characteristics,
                      label = paste0(value, "%"),
                      shape = sex)
  
  
  

## econ_2_2_1 ----
## Come back to this chart - 10 line charts with occupation as facets?
chart_econ_2_2_1 <- (ggplot(cansim_data$econ_2_2_1 %>% filter(national_occupational_classification_noc %in% 
                                                     (cansim_data$econ_2_2_1$national_occupational_classification_noc %>%
                                                     unique() %>%
                                                     head(5))), 
                             aes(x = ref_date, y = diff, colour = national_occupational_classification_noc)) +
  labs(x = NULL,
       y = "Male - female wages ($)", 
       title = "Difference in median hourly wage between genders ($)",
       subtitle = "Top 5 occupations with biggest wage gap",
       caption = "Source: Statistics Canada table 37-10-0047-01\nReference date: 2020; Frequency: Annual",
       colour = "National Occupational Classification (NOC)",
       shape = "National Occupational Classification (NOC)")) %>%
  line_chart(shape = national_occupational_classification_noc)
  

## econ_2_3_1 ----

chart_econ_2_3_1 <- (ggplot(cansim_data$econ_2_3_1, aes(x = value, y = age_group)) +
  labs(x = "Percent of (employed) persons aged 15 years and over",
       y = NULL, 
       title = "Proportion of full-time employment by gender (%)",
       caption = "Source: Statistics Canada table 14-10-0327-01\nReference date: 2020; Frequency: Annual") ) %>%
  cleveland_chart_duo(data = cansim_data$econ_2_3_1,
                      yaxis = age_group,
                      label = paste0(value, "%"),
                      shape = sex)
  
## econ_2_4_1 ----
chart_econ_2_4_1 <- (ggplot(cansim_data$econ_2_4_1, aes(y = activity_group, x = value)) +
    labs(x = "Proportion of day",
         y = NULL,
         title = "Proportion of day spent on unpaid work activities by gender (%)",
         caption = "Source: Statistics Canada table 45-10-0014-02\nReference date: 2015; Frequency: Occasional",
         shape = NULL) ) %>%
  cleveland_chart_duo(data = cansim_data$econ_2_4_1,
                      yaxis = activity_group, 
                      shape = sex,
                      label = paste0(value, "%"))

  
## econ_2_5_1 ----
chart_econ_2_5_1 <- (ggplot(cansim_data$econ_2_5_1, 
       aes(x = value, y = reorder(national_occupational_classification_noc, value))) +
  labs(y = NULL,
       x = "Percent of females",
       title = "Proportion of females in each occupation (%)",
       caption = "Source: Statistics Canada table 14-10-0335-01\nReference date: 2020; Frequency: Annual")) %>% 
  cleveland_chart(data = cansim_data$econ_2_5_1,
                  yaxis = national_occupational_classification_noc,
                  label = paste0(value,"%"))

#Leadership ----

## lead_3_1_1 ----
chart_lead_3_1_1 <- (ggplot(cansim_data$lead_3_1_1, aes(x = value, y = national_occupational_classification_noc)) +
                       labs(y = NULL,
                            x = "Percent of females",
                            title = "Proportion of females in management positions (%)",
                            caption = "Source: Statistics Canada table 14-10-0335-01\nReference date: 2020; Frequency: Annual")) %>% 
  cleveland_chart(data = cansim_data$lead_3_1_1,
                  yaxis = national_occupational_classification_noc,
                  label = paste0(value,"%"))

## lead_3_2_1 ----

chart_lead_3_2_1 <- (ggplot(cansim_data$lead_3_2_1, aes(x = firm_size,y = value,label=paste0(value, "%"), fill = gender_of_ownership)) + 
  labs(y = "Percent of businesses",
       x = NULL,
       title = "Proportion of businesses majority-owned by gender and business size (%)",
       caption = "Source: Statistics Canada table 33-10-0191-01\nReference date: 2013; Frequency: Occasional",
       fill = NULL)) %>%
  prop_bar_chart(colour = c(rep("white", 7), rep("black", 14)))


## Justice ----

## just_4_2_1 ----

chart_just_4_2_1 <- (ggplot(cansim_data$just_4_2_1, aes(x = value, y = selected_demographic_characteristics)) +
  labs(y = NULL,
       x = "Percent of population",
       title = "Proportion of population with self-reported assault by gender and demographic (%)",
       subtitle = "(Sexual assault since the age of 15)",
       caption = "Source: Statistics Canada table 35-10-0166-01\nReference date: 2018; Frequency: Every 5 years")) %>%
  cleveland_chart_duo(data = cansim_data$just_4_2_1,
                      yaxis = selected_demographic_characteristics, 
                      shape = gender,
                      label = paste0(value, "%"))

## just_4_3_1 ----

chart_just_4_3_1 <- (ggplot(cansim_data$just_4_3_1, aes(x = value, y = selected_demographic_characteristics)) +
  labs(y = NULL,
       x = "Percent of population",
       title = "Proportion of population with self-reported childhood maltreatment by gender and demographic (%)",
       subtitle = "(Physical or sexual abuse)",
       caption = "Source: Statistics Canada table 35-10-0167-01\nReference date: 2018; Frequency: Every 5 years")) %>%
  cleveland_chart_duo(data = cansim_data$just_4_3_1,
                      yaxis = selected_demographic_characteristics, 
                      shape = gender,
                      label = paste0(value, "%"))

## just_4_6_1 ----
chart_just_4_6_1 <- (ggplot(cansim_data$just_4_6_1, aes(x = value, y = indigenous_identity))+
   labs(y = NULL,
        x = "Percent of population",
        title = "Proportion of population with self-reported violence by gender and indigenous identity (%)",
        subtitle = "(Physical or sexual assault since the age of 15)",
        caption = "Source: Statistics Canada table 35-10-0168-01\nReference date: 2018; Frequency: Every 5 years"))  %>%
  cleveland_chart_duo_facet(data = cansim_data$just_4_6_1,
                            yaxis = indigenous_identity, 
                            facet = type_of_victimization,
                            shape = gender,
                            label = paste0(value, "%"))

# Poverty ----

## pov_5_2_1 ----

chart_pov_5_2_1 <- (ggplot(cansim_data$pov_5_2_1 %>% filter(household_food_security_status %in% c("Food insecure, severe", "Food insecure, moderate and severe")), 
                           aes(x = living_arrangement, y = value, 
                               label=paste0(value, "%"), fill = household_food_security_status)) + 
  labs (y = "Percent food security level",
        x = NULL,
        title = "Proportion of food security level by economic family type (%)",
        subtitle = "(Severe food insecurity)",
        caption = "Source: Statistics Canada table 13-10-0385-01\nReference date: 2017/18; Frequency: Occasional",
        fill = NULL)) %>%
  prop_bar_chart(colour = rep(c("white", "black"),8))

## pov_5_3_1 ----

chart_pov_5_3_1 <- (ggplot(cansim_data$pov_5_3_1, aes(x = value, y = selected_demographic_characteristics)) + 
  labs (y = NULL,
        x = "Percent in core housing need",
        title = "Proportion of population in core housing need by demographic (%)",
        subtitle = "(Comparing persons in/not in an economic family)",
        caption = "Source: Statistics Canada table 39-10-0050-01\nReference date: 2016; Frequency: Every 5 years")) %>%
  cleveland_chart_duo_facet(data = cansim_data$pov_5_3_1,
                            yaxis = selected_demographic_characteristics,
                            facet = economic_family_structure,
                            shape = sex,
                            label = paste0(value, "%"))

## pov_5_5_1 ----

chart_pov_5_5_1 <- (ggplot(cansim_data$pov_5_5_1, aes(x = value, y = cause_of_death_icd_10)) + 
  labs(y = NULL,
       x = "Percent of total deaths",
       title = "Proportion of causes of death by gender (%)",
       caption = "Source: Statistics Canada table 13-10-0800-01\nReference date: 2019; Frequency: Annual") ) %>%
  cleveland_chart_duo(data = cansim_data$pov_5_5_1,
                      yaxis = cause_of_death_icd_10,
                      shape = sex,
                      label = paste0(value, "%"))



 




