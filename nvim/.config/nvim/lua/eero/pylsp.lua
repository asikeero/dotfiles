return {
  init_options = {
    formatters = {
      black = {
        command = "black",
        args = {"--quiet", "-"}
      },
      formatFiletypes = {
        python = {"black"}
      }
    }
  }
}
