# Names of files.
# In order to keep order of files,
# filenames should be written here.
# If you need not keep order, you can use wild card.
# For example, '*.md'.
files = \
	hoge.md\

# Directory of files.
changed_files = files/*

# OS specific open command.
open_command = xdg-open  # Linux case
# open_command = open  # MacOS case
# open_command =  # Windows case


# Filetype of output.
default_type = pdf
# Filename without file type.
output_file = out
title = Title
# Reader arguments for pandoc.
reader = 

# Writer arguments for pandoc.
writer = --toc\
    --toc-depth=3\
    -T $(title)\
    --indented-code-classes=python,bash\


# PDF specific arguments.
pdf = -V documentclass=ltjarticle\
    -V geometry:left=2cm\
    -V geometry:right=2cm\
    -V CJKmainfont=IPAexGothic\
    -V lang=en-US\
    --pdf-engine=lualatex\
    --listings\
#    --template 

# HTML specific arguments
html = --metadata pagetitle="$(title)"\
    --self-contained\

# Markdown extention should be separated by '+'.
markdown_extention = -f markdown+hard_line_breaks

all: $(changed_files)
	cd files;pandoc -o ../$(output_file).$(default_type) $(reader) $(writer) $(pdf) $(markdown_extention) $(files)

%.html: $(changed_files)
	cd files;pandoc -o ../$@ $(reader) $(writer) $(html) $(markdown_extention) $(files)

%.pdf: $(changed_files)
	cd files;pandoc -o ../$@ $(reader) $(writer) $(pdf) $(markdown_extention) $(files)

%.docx: $(changed_files)
	cd files;pandoc -o ../$@ $(reader) $(writer) $(pdf) $(markdown_extention) $(files)

open:
	$(open_command) $(output_file).$(default_type)

