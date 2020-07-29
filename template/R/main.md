Peat Depth Model main script
================

## Setup

At the moment a bit of manual preparation is required:

1.  Use RStudio and create and RStudio project for your work.  

2.  In the project home directory, create a directory for the area you
    are modelling and give it a unique name (e.g. ‘dartmoor’)  

3.  In that directory, create the following folders
    
      - `data`
      - `outputs`
      - `R`

4.  Into folder `R` copy the above scripts.

## Workflow

This is the main script forming part of a workflow to model peat depth
for a given area. The entire workflow relies on a sequence of
*parameterised RMarkdown* scripts described here.

### Scripts

These scripts are designed to be executed in order. However, it is
expected that it is a process of review and refinement, going back to
step 1 or 2 as often as necessary.

1.  Import and prepare data using
    [import\_prepare\_data.Rmd](import_prepare_data.Rmd)
2.  Explore and select data using
    [explore\_and\_select\_data.Rmd](explore_and_select_data.Rmd)
3.  Create a model using [model.Rmd](model.Rmd)
4.  Evaluate the model using [evaluate.Rmd](evaluate.Rmd)
5.  Report and visualise model metrics using
    [visualise\_model\_results\_template.Rmd](visualise_model_results_template.Rmd)
6.  Produce prediction and variance rasters for export using
    [predict.Rmd](predict.Rmd)

In addition there are helper scripts with useful functions:

  - `rsquared_funs.R` defines functions for calculating the metrics
    *r-squared* and *adjusted r-squared*.

### Parameters

At the end of each script any outputs are saved to file and an R object
`parameters` is saved. `parameters` can then be read by subsequent
scripts to continue the workflow. This means you can close an R session
between scripts without losing work done in the previous script. Some of
these parameters are used in keeping track of the workflow:

  - `area_abbr`: A user defined abbreviation for the area to be modelled
    (e.g. “dart” for Dartmoor)

<<<<<<< HEAD
## About parameterised RMarkdown scripts

In parameterised RMarkdown scripts all the user defined parameters are
declared in the yaml header, and when the command
`knit_with_parameters('R/main.Rmd')` is given:
=======
## About parmaterised RMarkdown scripts

These are parameterised RMarkdown scripts. This means that all the user
defined parameters are declared in the yaml header, and when the command
`knit_with_parameters('~/GitHub/Peat_Depth_Model_pr/workflow/R/main.Rmd')`
(where `workflow` should be replaced with the name you gave the
directory) is given:
>>>>>>> 284eda1b28a2f65bd470f7c347a4a7ee0aadb500

  - a dialogue window appears asking the user to enter or confirm these
    parameters,
  - the script is executed, and
  - an html document is produced containing the formatted text, code,
    console outputs and visual outputs (unless any of these have been
    marked to be suppressed in the header of the code block).

The html document can then be stored as a record of the run. Currently
it is set to be overwritten on the next call to `knit` so you must
rename or move the document to retain it.  
There are two ways of running these scripts:

### Running each code block separately

To do this you need to change the input parameters in the yaml header
above. E.g. to change the peat depth data file, edit the file path next
to `value:` under the parameter `obs_path`:

    params:
      obs_path:
        input: file
        label: 'Observations data (shapefile):'
        value: ..\data\NNPA\Peat Depths.shp

Note that the value is not in quotations. The advantage of this is that
you can test your parameters at each stage and change them. You can also
change the code.

Once you are happy with the paramters and the code, you can produce an
output document by clicking `Knit`.

### Running the whole code in one go

To do this, select the toggle next to the `Knit` command and select
`Knit with Parameters...`. A dialogue will appear and ask you to enter
the parameters for the model run.
