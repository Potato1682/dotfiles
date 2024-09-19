options(
  repos = getOption("repos", c(CRAN = "https://cloud.r-project.org")),
  warn = 1,
  warnPartialMatchArgs = TRUE,
  warnPartialMatchAttr = TRUE,
  warnPartialMatchDollar = TRUE,
  showWarnCalls = TRUE,
  showErrorCalls = TRUE,
  readr.show_col_types = FALSE,
  radian.highlight_matching_bracket = TRUE,
  radian.tab_size = 2,
  radian.global_history_file = Sys.getenv("R_RADIAN_HISTFILE"),
  renv.config.pak.enabled = TRUE,
  clustermq.scheduler = "multicore",
  languageserver.formatting_style = \(.options) {
    style <- styler::tidyverse_style(indent_by = .options$tabSize)
    style$token$force_assignment_op <- NULL

    style
  }
)

.First <- function() {
  if (interactive() && !nzchar(Sys.getenv("RSTUDIO"))) {
    # Directory should exist to use R_LIBS_USER
    stopifnot(dir.exists(Sys.getenv("R_LIBS_USER")))

    options(defaultPackages = c(
      getOption("defaultPackages"),
      "conflicted",
      "future",
      "this.path"
    ))

    setHook(packageEvent("conflicted", "attach"), \(...) {
      library(tidyverse)
      library(tidylog)

      for (f in getNamespaceExports("tidylog")) {
        conflicted::conflict_prefer(f, "tidylog", quiet = TRUE)
      }
    })

    setHook(packageEvent("future", "attach"), \(...) {
      future::plan(future.callr::callr)
    })

    if (Sys.getenv("TERM_PROGRAM") == "vscode") {
      source("~/.vscode-R/init.R")
    }
  }
}

.Last <- function() {
  if (interactive()) {
    if (!nzchar(Sys.getenv("RADIAN_VERSION"))) {
      try(savehistory(Sys.getenv("R_HISTFILE")))
      print(ls(envir = .GlobalEnv, all.names = TRUE))
      print(sessionInfo(), locale = FALSE)
    }
  }
}
