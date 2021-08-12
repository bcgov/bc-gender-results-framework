bcstats_chart_theme <-
  theme_bw() +
  theme(
    panel.border = element_rect(colour="white"),
    text = element_text(size = 15),
    plot.title = element_text(face="bold"),
    legend.position="bottom",
    legend.justification=c(1,0),
    legend.title = element_text(size=12),
    legend.text = element_text(size=11),
    axis.line = element_line(colour="black"),
    axis.title = element_text(size=15),
    axis.text = element_text(size=12),
    plot.caption = element_text(hjust = 0),
    plot.caption.position = "plot"
    
  )

prop_bar_chart <- function(p, colour) {
  p +
    geom_col() +
    geom_text(position = position_stack(vjust = 0.5), colour = {{colour}}) +
    coord_flip() + 
    guides(fill = guide_legend(reverse = TRUE)) +
    bcstats_chart_theme + 
    #scale_y_continuous(expand = c(0,0)) +
    scale_fill_grey() 
}

bar_chart <- function(p, label, facets){
  p +
    geom_col() +
    geom_text(aes(label = {{label}}), hjust = 1.5, color = "white") +
    facet_wrap(facets = vars({{facets}}), ncol = 1, strip.position = "top") +
    bcstats_chart_theme
}

line_chart <- function(p, shape){
  p +
    geom_line() +
    geom_point(aes(shape = {{shape}}), size = 4) +
    scale_x_date(date_labels = "%Y", date_breaks = "1 year" ) +
    bcstats_chart_theme +
    scale_color_grey() 
}

cleveland_chart <- function(p, data, yaxis, label){
  p +
    geom_point(size = 4) +
    geom_segment( aes(xend=0, yend={{yaxis}})) +
    geom_text(aes(label = {{label}}), hjust = -0.5) +
    scale_x_continuous(limits = c(-3,max(data$value)+7), expand = c(0,0)) +
    bcstats_chart_theme 
 
} 

cleveland_chart_duo <- function(p, data, shape, yaxis, label){
  
  right_label <- data %>%
    select({{shape}}, {{yaxis}}, value) %>%
    group_by({{yaxis}}) %>%
    arrange(desc(value)) %>%
    top_n(1)
  
  left_label <- data %>%
    select({{shape}}, {{yaxis}}, value) %>%
    group_by({{yaxis}}) %>%
    arrange(desc(value)) %>%
    slice(2)
  
 p +
   labs(shape = NULL, colour = NULL) +
   geom_point(aes(shape = {{shape}}, colour = {{shape}}),size = 4) +
   geom_line( aes(group={{yaxis}})) +
   geom_text(data = right_label, aes(label = {{label}}, colour = {{shape}}), hjust = -1) +
   geom_text(data = left_label, aes(label = {{label}}, colour = {{shape}}), hjust = 2) +
   scale_x_continuous(limits = c(-3,max(data$value)+7), expand = c(0,0)) +
   bcstats_chart_theme +
   scale_color_manual(values = c("#333333", "#989898") )
} 


cleveland_chart_duo_facet <- function(p, data, shape, yaxis, facet, label){
  
  right_label <- data %>%
    select({{shape}}, {{yaxis}}, {{facet}}, value) %>%
    group_by({{facet}}, {{yaxis}}) %>%
    arrange(desc(value)) %>%
    top_n(1)
  
  left_label <- data %>%
    select({{shape}}, {{yaxis}}, {{facet}}, value) %>%
    group_by({{facet}}, {{yaxis}}) %>%
    arrange(desc(value)) %>%
    slice(2)
  
  p +
    labs(shape = NULL, colour = NULL) +
    facet_wrap(facets = vars({{facet}}), ncol = 1, strip.position = "top") +
    geom_point(aes(shape = {{shape}}, colour = {{shape}}),size = 4) +
    geom_line( aes(group={{yaxis}})) +
    geom_text(data = right_label, aes(label = {{label}}, colour = {{shape}}), hjust = -1) +
    geom_text(data = left_label, aes(label = {{label}}, colour = {{shape}}), hjust = 2) +
    scale_x_continuous(limits = c(-3,max(data$value)+7), expand = c(0,0)) +
    bcstats_chart_theme +
    scale_color_manual(values = c("#333333", "#989898") )
} 
