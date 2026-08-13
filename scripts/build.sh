#!/bin/sh
set -eu

site_dir=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
workspace_dir=$(CDPATH= cd -- "$site_dir/.." && pwd)
portfolio_cache_dir=${TMPDIR:-/tmp}/olorundara-portfolio-cache

mkdir -p "$portfolio_cache_dir"
export XDG_CACHE_HOME="$portfolio_cache_dir"

mkdir -p \
  "$site_dir/projects/incubed/analysis/figures" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_Deck/media" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media" \
  "$site_dir/projects/incubed/analysis/docx/2024_Johns_Hopkins_Healthcare_Design_Submission_-_IncuBed_(Images_and_References)/media/media" \
  "$site_dir/projects/incubed/analysis/docx/Title__IncuBed-_Designing_a_Cost-Effective_Incubator_for_Primary_Healthcare_Centers_in_Sub-Saharan_Africa/media/media" \
  "$site_dir/projects/aquabot/analysis/figures" \
  "$site_dir/projects/aquabot/sources/medium-images" \
  "$site_dir/projects/edge-inference-energy/analysis/figures" \
  "$site_dir/downloads"

cp "$workspace_dir/grad/Olorundara Akojede - CV.pdf" \
  "$site_dir/downloads/olorundara-akojede-cv.pdf"

cp "$workspace_dir/rice bme/incubed/analysis/figures/engineering_design_process.svg" \
  "$site_dir/projects/incubed/analysis/figures/"
cp "$workspace_dir/rice bme/incubed/analysis/figures/system_architecture.svg" \
  "$site_dir/projects/incubed/analysis/figures/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_Deck/media/image12.png" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_Deck/media/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_pitch_(1)/media/image3.jpg" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_pitch_(1)/media/image8.png" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_pitch_(1)/media/image15.png" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_pitch_(1)/media/image16.jpg" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media/"
cp "$workspace_dir/rice bme/incubed/analysis/pptx/IncuBed_pitch_(1)/media/image17.jpg" \
  "$site_dir/projects/incubed/analysis/pptx/IncuBed_pitch_(1)/media/"
cp "$workspace_dir/rice bme/incubed/analysis/docx/2024_Johns_Hopkins_Healthcare_Design_Submission_-_IncuBed_(Images_and_References)/media/media/image7.jpg" \
  "$site_dir/projects/incubed/analysis/docx/2024_Johns_Hopkins_Healthcare_Design_Submission_-_IncuBed_(Images_and_References)/media/media/"
cp "$workspace_dir/rice bme/incubed/analysis/docx/Title__IncuBed-_Designing_a_Cost-Effective_Incubator_for_Primary_Healthcare_Centers_in_Sub-Saharan_Africa/media/media/image1.png" \
  "$site_dir/projects/incubed/analysis/docx/Title__IncuBed-_Designing_a_Cost-Effective_Incubator_for_Primary_Healthcare_Centers_in_Sub-Saharan_Africa/media/media/"

cp "$workspace_dir/grad/aquabot/analysis/figures/system_architecture.svg" \
  "$site_dir/projects/aquabot/analysis/figures/"
cp "$workspace_dir/grad/aquabot/sources/medium-images/medium-image-05.png" \
  "$site_dir/projects/aquabot/sources/medium-images/"
cp "$workspace_dir/grad/aquabot/sources/medium-images/medium-image-07.png" \
  "$site_dir/projects/aquabot/sources/medium-images/"
cp "$workspace_dir/grad/aquabot/sources/medium-images/medium-image-10.png" \
  "$site_dir/projects/aquabot/sources/medium-images/"
cp "$workspace_dir/grad/aquabot/sources/medium-images/medium-image-11.png" \
  "$site_dir/projects/aquabot/sources/medium-images/"
cp "$workspace_dir/grad/aquabot/sources/medium-images/medium-image-13.jpg" \
  "$site_dir/projects/aquabot/sources/medium-images/"

cp "$workspace_dir/hardware/runs/canonical/artifacts/figures/corpus_composition.png" \
  "$site_dir/projects/edge-inference-energy/analysis/figures/"
cp "$workspace_dir/hardware/runs/canonical/artifacts/figures/matched_std_dw_pairs.png" \
  "$site_dir/projects/edge-inference-energy/analysis/figures/"
cp "$workspace_dir/hardware/runs/canonical/artifacts/figures/matched_std_dw_pairs_table.png" \
  "$site_dir/projects/edge-inference-energy/analysis/figures/"
cp "$workspace_dir/hardware/runs/canonical/artifacts/figures/static_bytes_vs_macs_runtime_shape.png" \
  "$site_dir/projects/edge-inference-energy/analysis/figures/"

pandoc "$workspace_dir/rice bme/incubed/INCUBED_TECHNICAL_CASE_STUDY.md" \
  --from=gfm \
  --to=html5 \
  --template="$site_dir/templates/project.html" \
  --metadata pagetitle="IncuBed" \
  --metadata projecttype="Engineering design case study" \
  --metadata projectmeta="Neonatal thermal care · UNILAG Design Studio · 2022–2024" \
  --metadata description="Development of a neonatal incubator prototype for rural primary healthcare in Nigeria." \
  --metadata pdfname="incubed-technical-case-study.pdf" \
  --output="$site_dir/projects/incubed/index.html"

pandoc "$workspace_dir/grad/aquabot/AQUABOT_TECHNICAL_CASE_STUDY.md" \
  --from=gfm \
  --to=html5 \
  --template="$site_dir/templates/project.html" \
  --metadata pagetitle="AquaBot" \
  --metadata projecttype="Engineering design case study" \
  --metadata projectmeta="Automated scientific sampling · Rice OEDK · 2024" \
  --metadata description="Development of an automated surface-water sampler for time-series trace-element monitoring." \
  --metadata pdfname="aquabot-technical-case-study.pdf" \
  --output="$site_dir/projects/aquabot/index.html"

pandoc "$workspace_dir/hardware/EDGE_INFERENCE_ENERGY_CASE_STUDY.md" \
  --from=gfm \
  --to=html5 \
  --template="$site_dir/templates/project.html" \
  --metadata pagetitle="Edge-inference energy benchmark" \
  --metadata projecttype="Research case study · Pre-hardware phase" \
  --metadata projectmeta="TinyML and embedded inference · Independent research · 2026–present" \
  --metadata description="Design and pre-hardware results for a controlled study of operation-count metrics and edge-inference energy." \
  --metadata bodyclass="edge-energy-case-study" \
  --metadata pdfname="edge-inference-energy-case-study.pdf" \
  --output="$site_dir/projects/edge-inference-energy/index.html"

weasyprint \
  "$site_dir/projects/incubed/index.html" \
  "$site_dir/downloads/incubed-technical-case-study.pdf"
weasyprint \
  "$site_dir/projects/aquabot/index.html" \
  "$site_dir/downloads/aquabot-technical-case-study.pdf"
weasyprint \
  "$site_dir/projects/edge-inference-energy/index.html" \
  "$site_dir/downloads/edge-inference-energy-case-study.pdf"

echo "Portfolio built at $site_dir"
