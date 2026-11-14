"""Build the assignment submission PDF (GitHub link placeholder)."""
from pathlib import Path

from fpdf import FPDF

# Replace this after you create the GitHub repo, then re-run the script.
GITHUB_LINK = "https://github.com/YOUR_USERNAME/three_pages"


class SubmissionPDF(FPDF):
    def header(self):
        self.set_draw_color(14, 107, 107)
        self.set_line_width(0.8)
        self.line(20, 15, 190, 15)

    def footer(self):
        self.set_y(-20)
        self.set_draw_color(14, 107, 107)
        self.line(20, 277, 190, 277)
        self.set_font("Helvetica", "", 9)
        self.set_text_color(110, 110, 110)
        self.cell(0, 10, "Flutter Assignment - Three Pages", align="C")


def main():
    pdf = SubmissionPDF()
    pdf.set_auto_page_break(auto=True, margin=25)
    pdf.add_page()
    pdf.set_margins(20, 25, 20)

    pdf.ln(20)
    pdf.set_font("Helvetica", "B", 22)
    pdf.set_text_color(14, 107, 107)
    pdf.cell(0, 12, "Flutter Assignment", align="C", new_x="LMARGIN", new_y="NEXT")

    pdf.set_font("Helvetica", "", 14)
    pdf.set_text_color(60, 60, 60)
    pdf.cell(0, 10, "Three Pages App", align="C", new_x="LMARGIN", new_y="NEXT")

    pdf.ln(18)
    pdf.set_font("Helvetica", "B", 13)
    pdf.set_text_color(30, 30, 30)
    pdf.cell(0, 10, "Project", new_x="LMARGIN", new_y="NEXT")
    pdf.set_font("Helvetica", "", 12)
    pdf.set_text_color(50, 50, 50)
    pdf.multi_cell(0, 8, "A Flutter app with Home, About, and Contact pages.")

    pdf.ln(10)
    pdf.set_font("Helvetica", "B", 13)
    pdf.set_text_color(30, 30, 30)
    pdf.cell(0, 10, "GitHub Repository Link", new_x="LMARGIN", new_y="NEXT")

    pdf.set_fill_color(244, 247, 247)
    pdf.set_draw_color(14, 107, 107)
    pdf.set_line_width(0.4)
    y = pdf.get_y() + 2
    pdf.rect(20, y, 170, 22, style="DF")
    pdf.set_xy(24, y + 6)
    pdf.set_font("Helvetica", "", 11)
    pdf.set_text_color(14, 107, 107)
    pdf.multi_cell(162, 6, GITHUB_LINK)

    pdf.ln(16)
    pdf.set_font("Helvetica", "I", 10)
    pdf.set_text_color(120, 120, 120)
    pdf.multi_cell(
        0,
        6,
        "Replace YOUR_USERNAME in the link above with your GitHub username "
        "after uploading the project, then regenerate this PDF.",
    )

    out = Path(__file__).resolve().parents[1] / "submission" / "GitHub_Link.pdf"
    out.parent.mkdir(parents=True, exist_ok=True)
    pdf.output(out)
    print(out)


if __name__ == "__main__":
    main()
