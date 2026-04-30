render_link <- function(program, link_stub, link_text) {
    paste0("[", link_text, "](", link_stub, utils::URLencode(program), ")")
}

render_block <- function(program) {
    paste(c("```fortran", program, "```"), collapse="\n")
}

cat_link_and_block <- function(program, link_stub="https://dev.lfortran.org/?code=", link_text="Link to run the program") {
    cat(render_block(program))
    cat("\n")
    cat(render_link(program, link_stub, link_text))
    cat("\n")
}


read_program <- function(program_name, program_dir="") {
    paste(readLines(paste(program_dir, program_name, sep="/")), collapse="\n")
}

cat_program <- function(program_dir, program_name, link_stub="https://dev.lfortran.org/?code=", link_text="Link to run the program") {
    program <- read_program(program_name=program_name, program_dir=program_dir)
    cat_link_and_block(program, link_stub=link_stub, link_text=link_text)
}
