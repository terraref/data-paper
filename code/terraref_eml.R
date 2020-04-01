# Code used to generate metadata/eml_metadata.xml
library(EML)
dsl <- eml$creator(individualName = eml$individualName(givenName = "David",
                                                       surName = "LeBauer"),
                   organizationName = "University of Arizona",
                   electronicMailAddress = "dlebauer@arizona.edu",
                   userId = list(directory = "https://orcid.org",
                                 userId    = "https://orcid.org/0000-0001-7228-053X"))

doc <- list(packageId = "dataset-1", system = "Dryad",
            dataset = eml$dataset(
              title = "Data From: TERRA REF, An Open Reference Data Set From High Resolution Genomics, Phenomics, and Imaging Sensors",
              creator = dsl,
              contact = dsl))

abstract <- EML::set_TextType("metadata/abstract.md")
class(abstract) <- 'abstract'
doc$dataset$abstract <- abstract


library(traits)
options(betydb_url = "https://terraref.ncsa.illinois.edu/bety/",
        betydb_api_version = 'v1')

mac_field <- betydb_query(table = 'sites', sitename = '~MAC Field Scanner Field')
library(sf)

mac_bounds <- st_bbox(st_as_sfc(mac_field$geometry))

sorghum <- betydb_query(table = 'species', genus = 'Sorghum')

species <-   data.frame(Genus = sorghum$genus, 
                        Species = sorghum$scientificname)

doc$dataset$coverage <- set_coverage(beginDate = "2017-04-13",
                                     endDate = "2018-08-02",
                                     geographicDescription   = "Maricopa Agricultural Center, Maricopa, AZ",
                                     sci_names = species,
                                     westBoundingCoordinate  = mac_bounds['xmin'],
                                     eastBoundingCoordinate  = mac_bounds['xmax'],
                                     northBoundingCoordinate = mac_bounds['ymax'],
                                     southBoundingCoordinate = mac_bounds['ymin']
)

# 
# doc$dataset$methods <- EML::set_methods(
#   sampling_file = 'metadata/experiments.md',
#   methods_file = 'metadata/methods.md')

#doc$dataset$dataTable <- eml$dataTable(
#  entityName = 'metadata/germplasm.csv',
#  entityDescription = paste0("List of Sorghum genotypes ('accessions')",
#                             "and experiments in which they were included"))

eml_validate(doc)
write_eml(doc, "metadata/eml_metadata.xml")
