all: main.pdf

main.pdf: main.tex references.bib Fig*.pdf Table*.tex
	latexmk -pdf main.tex

Fig*.pdf:
	datalad get adaptation_specialization_material/output/acl_2002_2022/*.pdf
	datalad get adaptation_specialization_material/output/*.pdf
	datalad get adaptation_specialization_material/output/etm_20_r/*.pdf
	datalad get adaptation_specialization_material/output/etm_15_pretrained/*.pdf
	datalad get adaptation_specialization_material/output/etm_25_pretrained/*.pdf
	cp -L adaptation_specialization_material/output/etm_20_r/sankey_control_control_nu_compact.pdf ./Fig3a.pdf
	cp -L adaptation_specialization_material/output/etm_20_r/sankey_control_control_nu_compact_darkmatter.pdf ./Fig3b.pdf
	cp -L adaptation_specialization_material/output/etm_20_r/portfolios_S.Ando.1.eps ./Fig4a.eps
	cp -L adaptation_specialization_material/output/etm_20_r/portfolios_J.Huston.1.eps ./Fig4b.eps
	cp -L adaptation_specialization_material/output/etm_20_r/change_score_effects_entropy_magnitude.eps ./Fig5.eps
	cp -L adaptation_specialization_material/output/etm_20_r/entered_score_effects_entropy_magnitude.eps ./Fig6.eps
	cp -L adaptation_specialization_material/output/etm_20_r/ei_gamma_control_nu.eps ./Fig7a.eps
	cp -L adaptation_specialization_material/output/etm_20_r/ei_delta_control_nu.eps ./Fig7b.eps
	cp -L adaptation_specialization_material/output/experiments.eps ./Fig8.eps
	cp -L adaptation_specialization_material/output/etm_20_r/age.pdf ./Fig9.pdf
	cp -L adaptation_specialization_material/output/word2vec_validation.pdf ./word2vec_validation.pdf
	cp -L adaptation_specialization_material/output/etm_20_r/topic_citation_matrix.eps ./Fig10.eps
	cp -L adaptation_specialization_material/output/etm_20_r/topic_experiments.eps ./topic_experiments.eps
	cp -L adaptation_specialization_material/output/etm_20_r/pacs_clustermap.eps ./Fig11.eps
	cp -L adaptation_specialization_material/output/etm_20_r/capital_measures.eps ./Fig12.eps
	cp -L adaptation_specialization_material/output/etm_20_r/cost_matrix_knowledge_bounded.eps ./Fig13.eps
	cp -L adaptation_specialization_material/output/etm_20_r/cost_vs_nu_knowledge.eps ./Fig14a.eps
	cp -L adaptation_specialization_material/output/etm_20_r/ei_R_control_nu.eps ./Fig14b.eps
	cp -L adaptation_specialization_material/output/etm_20_r/change_disruption_score.eps ./Fig15.eps
	cp -L adaptation_specialization_material/output/etm_20_r/change_score_effects_entropy_magnitude.eps ./Fig16.eps
	cp -L adaptation_specialization_material/output/etm_20_r/change_score_effects_entropy_magnitude_fla.pdf ./change_score_effects_entropy_magnitude_fla.pdf
	cp -L adaptation_specialization_material/output/etm_20_r/entered_score_effects_entropy_magnitude_fla.pdf ./entered_score_effects_entropy_magnitude_fla.pdf
	cp -L adaptation_specialization_material/output/etm_15_pretrained/change_score_effects_entropy_magnitude_compact.pdf ./change_score_effects_entropy_magnitude_15.pdf
	cp -L adaptation_specialization_material/output/etm_15_pretrained/entered_score_effects_entropy_magnitude_compact.pdf ./entered_score_effects_entropy_magnitude_15.pdf
	cp -L adaptation_specialization_material/output/etm_25_pretrained/change_score_effects_entropy_magnitude_compact.pdf ./change_score_effects_entropy_magnitude_25.pdf
	cp -L adaptation_specialization_material/output/etm_25_pretrained/entered_score_effects_entropy_magnitude_compact.pdf ./entered_score_effects_entropy_magnitude_25.pdf
	cp -L adaptation_specialization_material/output/acl_2002_2022/sankey_control_nu_acl.pdf ./Fig17.pdf
	
Table*.tex:
	cp -L adaptation_specialization_material/output/etm_20_r/topics.tex ./Table1.tex
	cp -L adaptation_specialization_material/output/scores.tex ./Table2.tex
	cp -L adaptation_specialization_material/output/etm_20_r/summary_change_disruption.tex ./Table3.tex
	cp -L adaptation_specialization_material/output/etm_20_r/summary_entered_exited.tex ./Table4.tex

clean:
	rm -rf rm -f *.bbl *.aux *.blg *.log *.out *.pdf *.tdo *.fls *.fdb_latexmk *.ist *-eps-converted-to.pdf *.bcf *.run.xml *.acn *.synctex.gz *.toc
	rm -rf ./Fig*.eps
	rm -rf ./Fig*.pdf
	rm -rf ./Fig*.png
	rm -rf ./Table*.tex
	datalad drop adaptation_specialization_material/output/etm_20_r/*.pdf

diff: main.tex references.bib Fig*.pdf Table*.tex
	git show 3290b4afdf51416a51e56fe537180eb379192873:main.tex > v1.tex
	latexdiff v1.tex main.tex > diff.tex
	latexmk -pdf diff.tex
