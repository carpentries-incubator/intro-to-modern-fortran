#' Render a link containing a fortran program
#' 
#' @param program the program as a single string
#' @param link_stub the base of the link that the program will be inserted to
#' @param link_text the text to be displayed as the link
#' @return A markdown-formatted link string.
render_link <- function(program, link_stub, link_text) {
    paste0("You can run this program on [", link_text, "](", link_stub, utils::URLencode(program), ").")
}

#' Render a fortran program as a fenced block
#' 
#' @param program the program as a single string
#' @return A markdown-formatted fortran fence block
render_block <- function(program) {
    paste(c("```fortran", program, "```"), collapse="\n")
}

#' Render a fortran program as a fenced block
#' 
#' @param program the program as a single string
#' @param link_stub the base of the link that the program will be inserted to
#' @param link_text the text to be displayed as the link
#' @return Nothing, but it does cat the link and then the program as a fenced block  
cat_link_and_block <- function(program, link_stub="https://dev.lfortran.org/?code=", link_text="lfortran") {
    cat(render_link(program, link_stub, link_text))
    cat("\n")
    cat(render_block(program))
    cat("\n")
}

#' Read a program from a file
#' 
#' @param program_dir the directory containing the program file
#' @param program_name the program name (including file extension)
#' @return The program as a single string with newlines
read_program <- function(program_dir="./", program_name) {
    paste(readLines(paste(program_dir, program_name, sep="/")), collapse="\n")
}

#' Read a program from a file
#' 
#' @param program_dir the directory containing the program file
#' @param program_name the program name (including file extension)
#' @param link_stub the base of the link that the program will be inserted to
#' @param link_text the text to be displayed as the link
#'
#' @return The program as a single string with newlines
cat_program <- function(program_dir, program_name, link_stub="https://dev.lfortran.org/?code=", link_text="lfortran") {
    program <- read_program(program_name=program_name, program_dir=program_dir)
    cat_link_and_block(program, link_stub=link_stub, link_text=link_text)
}
