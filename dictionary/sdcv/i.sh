#!/bin/bash
# vi:set nu nowrap:
# i.sh: <+ =Short Description= +>.

# $Id:$
# Federal University of Rio de Janeiro
#      Author: Ivan carlos da Silva Lopes
#        Mail: lopesivan (dot) ufrj (at) gmail (dot) com
#     License: gpl
#    Language: Shell Script
#        File: i.sh
#        Date: Tue 07 Jul 2009 05:54:01 PM BRT
# Description:
#
#

# ----------------------------------------------------------------------------
for bz2 in *.bz2; do
	tar xvjf $bz2
done
# ----------------------------------------------------------------------------
exit 0

cat > alias.txt << EOF
alias d_britannicaconcise='   sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-BritannicaConcise-2.4.2/'
alias d_cmudict='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-cmudict-2.4.2/'
alias d_cmupd='               sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-cmupd-2.4.2/'
alias d_bouvier='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-bouvier-2.4.2/'
alias d_easton='              sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-easton-2.4.2/'
alias d_gazetteer2k_counties='sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-gazetteer2k-counties-2.4.2/'
alias d_gazetteer2k_zips='    sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-gazetteer2k-zips-2.4.2/'
alias d_jargon='              sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-jargon-2.4.2/'
alias d_moby_thesaurus='      sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-moby-thesaurus-2.4.2/'
alias d_vera='                sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-vera-2.4.2/'
alias d_web1913='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-web1913-2.4.2/'
alias d_world02='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd-world02-2.4.2/'
alias d_devils='              sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_devils-2.4.2/'
alias d_elements='            sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_elements-2.4.2/'
alias d_foldoc='              sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_foldoc-2.4.2/'
alias d_gazetteer='           sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_gazetteer-2.4.2/'
alias d_gcide='               sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_gcide-2.4.2/'
alias d_hitchcock='           sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_hitchcock-2.4.2/'
alias d_wn='                  sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_wn-2.4.2/'
alias d_world95='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-dictd_www.dict.org_world95-2.4.2/'
alias d_eng_irregular='       sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-eng_irregular-2.4.2/'
alias d_englishetymology='    sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-EnglishEtymology-2.4.2/'
alias d_longman='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-longman-2.4.2/'
alias d_merrianwebster='      sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-merrianwebster-2.4.2/'
alias d_oald='                sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-oald-2.4.2/'
alias d_oxford_collocations=' sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-oxford_collocations-2.4.2/'
alias d_thesaurus='           sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-thesaurus-ee-2.4.2/'
alias d_acronyms='            sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-acronyms-2.4.2'
alias d_pt2en='               sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-freedict-por-eng-2.4.2'
alias d_en2pt='               sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-idp-eng-por-2.4.2'
alias d_wordnet='             sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-wordnet-3.0.0'
alias d_computer='            sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-xfardic-computer-elec-2.4.2'
alias d_gnu='                 sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-xfardic-gnu-linux-2.4.2'
alias pt2en='                 sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-freedict-por-eng-2.4.2'
alias en2pt='                 sdcv --data-dir ~/.config/nvim/dictionary/Sdcv/stardict-idp-eng-por-2.4.2'

EOF
