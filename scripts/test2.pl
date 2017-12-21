#!/usr/bin/perl -w

use Capability::Tokenize;
use Data::Dumper;

print Dumper
  (tokenize_treebank
   ("Andrew Dougherty is an autodidact mathematician and computer scientist specializing in Artificial Intelligence (AI) and Algorithmic Information Theory (AIT) . He is the founder of the FRDCSA project, a practical attempt at weak AI aimed primarily at collecting and
interrelating existing software with theoretical motivation from AIT. He has made over 90 open source applications, 400 (unofficial) Debian GNU/Linux packages and 800 Perl5 modules (see http://frdcsa.onshore.net/frdcsa).

Results in AIT suggest that a system size is a good heuristic for selecting more capable AI systems (it is a necessary but insufficient condition). The easiest practical, apparently underused method of building AI systems that satisfy this heuristic is to collect, package and
interrelate existing AI systems. The proof that this method is not being adopted is the lack of packages for major Linux distributions of extant Linux AI systems such as OpenCyc, ConceptNet, Enju, etc. In fact, most major research AI systems have not been packaged for any
operating system that has a package archive. This single limitation is problematic enough to warrant that the major mission of the FRDCSA is to create these packages. So far it has made 400 packages of previously unpackaged AI systems, most of which are now available for
public download. The Packager application is a program that semi-automatically generates packages of existing programs, and has completely automatically generated most of the packages in the archive.
"));
