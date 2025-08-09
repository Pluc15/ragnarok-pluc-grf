# Pluc RO Tools

## Description

A collection of tools, configurations, and GRF edits to enhance and customize the Ragnarok Online client experience. This repository includes visual tweaks, quality-of-life improvements, and utilities for easier setup and maintenance.

## What's in here?

- GRF edits
  - Minifications (`data_min_effect`)
  - Grey world (`data_maps`)
  - Big MVPs (`data_mvp`)
  - Misc improvements like camera angles and no frost jokes (`data_misc`)
  - Specific servers improvements (like `data_revenant`)
- Configuration for Gepard /effect bypass (`dist/effects_settings.txt`)
- LGP configuration + images in the GRF (`dist/plugin.ini` and `data_lgp`)
- Command line tool to pack the grf yourself
- My dinput configs (you probably shouldnt use that, this is just the window dimensions to fit my resolution)
- A version of dgVoodoo files that works for RO client (version `2.75.1`)

## How to install

- Double click `pack.bat`
- Copy the following files from `/dist/` into your RO folder
  - `effects_settings.txt`
  - `plugin.ini`
  - `pluc.grf`
  - (if you are playing Project Revenant) `pluc_revenant.grf`
- Update your `data.ini` file in your RO folder
  - Put `pluc.grf` and (if applicable) `pluc_revenant.grf` first
  - Ex:
  ```
  [Data]
  1=pluc.grf
  2=pluc_revenant.grf
  6=revenant.grf
  7=odata.grf
  8=rdata.grf
  9=data.grf
  ```
