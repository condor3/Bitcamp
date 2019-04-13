library(tidyverse)
library(rvest)

wals_value_table_getter <- function(url) {
    url %>%
    read_html() %>%
    html_node(".span4") %>%
    html_node(".table") %>%
    html_table() %>%
    select(2:3) %>%
    magrittr::set_colnames(c("value", "count")) %>%
    mutate("percentage" = .$count / sum(.$count)) %>%
    as_tibble()
}