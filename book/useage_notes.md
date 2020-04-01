# Useage Notes

## Archive Contents


### Code

### Data 

This is a summary of the data available in this archive, and how to access it:

#### File Manifests

These are json files that list the files and their contents that are not included in this repository. We follow a XYZ standard. 



#### Phenotypes

```sh 
cd data
zip season_4_traits.zip data/season_4_traits/ && 
zip data/season_6_traits.zip data/season_6_traits/

## sync to google drive on my local computer
cp -r season_*_traits.zip ~/Google\ Drive\ File\ Stream/My\ Drive/TERRA-REF/Publications\ and\ Authorship\ /LeBauer\ et\ al\ data\ descriptor/Dryad\ Content/data/
```

### Meta-data

/metadata folder
* eml_metadata.xml Annotation using Ecological Metadata Language

data 


## Software and cloud data

Because of their size, only the sensor data products are not included in this repository.

Using cloud services is described extensively in the TERRA REF documentation:
  * website: https://docs.terraref.org/
  * source: github.com/terraef/documentation
  * archive: David LeBauer, Craig Willis, Rachel Shekar, Max Burnette, Ting Li, Scott Rohde, et al. 2020. “Terraref/documentation: Season 6 Data Publication (2019)”. Zenodo. doi:10.5281/zenodo.597425

Hands-on examples for accessing many datasets are provided in the tutorials: Tutorials for accessing and understanding data
  * website: https://terraref.org/tutorials
  * source: github.com/terraref/tutorials
  * archive: TBD
  * YouTube: https://www.youtube.com/channel/UComeQAqYR5aZrXN_3K5iFGw

In addition, the GitHub repository for the TERRA REF data publication and data paper contains extensive code used to download archived copies of the data.

## Trait Data

Trait data is available as csv files in this repository. 
You can also access the entire database at terraref.org/bety through the API, or you can run a copy of the database on your own computer if you have the freely available cross-platform Docker software. This is described in the TERRA REF documentation and tutorials.

## Unpublished data and future releases

_Insert table of seasons and comments here_