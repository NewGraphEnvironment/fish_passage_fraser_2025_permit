
# just run this if we want latest util function.  Really just an example here
staticimports::import()

{
  # Parameterize the memo name
  name_memo <- "application_moe_dfo"

  # Render outputs
  rmarkdown::render(
    input = paste0(name_memo, ".Rmd"),
    output_file = fs::path("docs", "index.html")
  )

  pagedown::chrome_print(
    input = paste0(name_memo, ".Rmd"),
    output = fs::path("docs", paste0(name_memo, ".pdf"))
  )

  # DFO-specific attachments: trim the map and site list pages
  page_map <- 5
  page_site_list <- 6:12

  input_pdf <- fs::path("docs", paste0(name_memo, ".pdf"))

  pdftools::pdf_subset(
    input = input_pdf,
    pages = page_map,
    output = fs::path("docs", "application_dfo_map.pdf")
  )

  pdftools::pdf_subset(
    input = input_pdf,
    pages = page_site_list,
    output = fs::path("docs", "application_dfo_site_list.pdf")
  )
}
