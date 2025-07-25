
# just run this if we want latest util function.  Really just an example here
staticimports::import()

{
  rmarkdown::render(input = 'application_moe.Rmd', output_file = 'docs/index.html')
  pagedown::chrome_print(input = 'application_moe.Rmd', output = 'docs/application_moe_dfo.pdf')

  # we want to separately attach a map and a list of sites for DFO
  #
  ## trim up the file.  We ditch the last page only when there are references.

  # specifiy the page numbers of the map and the site lists
  page_map <- 5
  page_site_list <- 6:12

  pdftools::pdf_subset("docs/application_moe_dfo.pdf",
                       pages = page_map, output = "docs/application_dfo_map.pdf")

  # trim up the file.  We ditch the last page only when there are references.
  pdftools::pdf_subset("docs/application_moe_dfo.pdf",
                       pages = page_site_list, output =  "docs/application_dfo_site_list.pdf")
}

