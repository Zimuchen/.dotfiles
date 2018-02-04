#! /usr/local/bin python3
import argparse
import yaml
import subprocess
import os
from pylatex import Document
from pylatex.utils import NoEscape
import parseTeXlog

parser = argparse.ArgumentParser()
parser.add_argument("inputfile", help="input file")
args = parser.parse_args()

inputfile = os.path.abspath(args.inputfile)
input_dir = os.path.dirname(inputfile)
outputfile = input_dir + '/' + os.path.splitext(os.path.basename(inputfile))[0] + '.tex'

document = open(inputfile)

pandoc_arg = ['pandoc', '-F', 'pandoc-crossref', inputfile, '-o', outputfile]

metadata = next(yaml.load_all(document))
if 'output' in metadata.keys() and 'pdf_document' in metadata['output'].keys():
    config = metadata['output']['pdf_document']

    if 'toc' in config.keys():
        pandoc_arg.append("--toc")

    if 'toc_depth' in config.keys():
        pandoc_arg.append("--toc-depth=" + config['toc_depth'])

    if 'citation_package' in config.keys():
        if config['citation_package'] == 'natbib':
            pandoc_arg.append('--natbib')
        elif config['citation_package'] == 'biblatex':
            pandoc_arg.append('--biblatex')

    if 'number_section' in config.keys():
        pandoc_arg.append("--number-section")

    if 'latex_engine' in config.keys():
        pandoc_arg.append("--pdf-engine=" + config['latex_engine'])
        engine = config['latex_engine']

    if 'template' in config.keys():
        pandoc_arg.append("--template=" + config['template'])
    # if 'template' in config.keys():
    #     pandoc_arg.append("--template")
    #     pandoc_arg.append(config['template'])

    if 'includes' in config.keys() and type(config['includes']) is dict:
        includesConfig = config['includes']
        if 'in_header' in includesConfig.keys():
            pandoc_arg.append('--include-in-header=' + includesConfig['in_header'])
        if 'before_body' in includesConfig.keys():
            pandoc_arg.append('--include-before-body=' + includesConfig['before_body'])
        if 'after_body' in includesConfig.keys():
            pandoc_arg.append('--include-after-body=' + includesConfig['after_body'])

# print(subprocess.list2cmdline(pandoc_arg))
subprocess.run(pandoc_arg, stdout=subprocess.PIPE)

if engine is not None:
    engine = '-' + engine
else:
    engine = '-pdflatex'

command = ['latexmk', '-cd', '-f', engine, '--interaction=nonstopmode', outputfile]

os_error = None

output = subprocess.run(command, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

errors = []
warnings = []
badboxes = []

logfilename = outputfile[:-3] + 'log'
data = open(logfilename, 'rb').read()
root_dir = os.path.dirname(logfilename)
# print(root_dir)
try:
    errors, warnings, badboxes = parseTeXlog.parse_tex_log(data, root_dir)
    if errors:
        raise Exception("Errors")
    if warnings:
        if errors:
            pass
        else:
            raise Exception("Warnings")
    if badboxes:
        if warnings or errors:
            pass
        else:
            raise Exception("badboxes")
except Exception as e:
    if errors:
        print('Error:')
        for err in errors:
            print(err)
    if warnings:
        if errors:
            print("")
        else:
            print ("Warnings:")
            for warn in warnings:
                print(warn)
    if badboxes:
        if warnings or errors:
            print("")
        else:
            print("Bad boxes:")
            for box in badboxes:
                print(box)
    raise

extensions = ['aux', 'log', 'out', 'fls', 'fdb_latexmk', 'blg', 'bbl', 'xdv']

for ext in extensions:
    try:
        os.remove(outputfile[:-3] + ext)
    except (OSError, IOError) as e:
        pass