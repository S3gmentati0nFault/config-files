function lcompile

	# Set the function's flags
	set --local options 'h/help' 'b/bibliography'
	argparse $options -- $argv

	if set --query _flag_help
		printf "Usage: lcompile [-h -b] FILE\n\n"
		printf "Options:\n"
		printf "\t-h/--help\t\tPrints help and exits\n"
		printf "\t-b/--bibliography\t\tLaunches an extended compile process where the
		bibliography is also regenerated\n"
		return
	end

	if set --query _flag_bibliography
		pdflatex "$argv.tex" && biber $argv && pdflatex "$argv.tex" && pdflatex "$argv.tex"
		return
	end

	pdflatex "$argv.tex"
end
