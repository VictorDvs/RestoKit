import re
from pathlib import Path
from deep_translator import GoogleTranslator

base_path = Path(__file__).resolve().parent.parent
source_dir = base_path / "docs" / "fr"
target_dir = base_path / "docs" / "en"

def clean_translation(original: str, translated: str) -> str:
    leading_spaces = re.match(r"^(\s*)", original).group(1)
    translated = re.sub(r"\*\s+", "**", translated)
    translated = re.sub(r"\s+\*", "*", translated)
    translated = re.sub(r"__\s+", "__", translated)
    translated = re.sub(r"\s+__", "__", translated)
    translated = re.sub(r"^-([^\s])", r"- \1", translated)
    return leading_spaces + translated.strip()

def translate_markdown(content: str) -> str:
    lines = content.splitlines()
    translated_lines = []

    inside_code_block = False
    for idx, line in enumerate(lines, start=1):
        if line.strip().startswith("```"):
            inside_code_block = not inside_code_block
            translated_lines.append(line)
            continue

        if inside_code_block or not line.strip():
            translated_lines.append(line)
            continue

        try:
            translated = GoogleTranslator(source='fr', target='en').translate(line)
            if translated is None:
                raise ValueError("Traduction retournée vide")
            cleaned = clean_translation(line, translated)
            translated_lines.append(cleaned)
        except Exception as e:
            print(f"  ⚠️ Ligne {idx}: erreur de traduction ({e}) → conservée telle quelle")
            translated_lines.append(line)

    return "\n".join(translated_lines)

for md_file in source_dir.rglob("*.md"):
    relative_path = md_file.relative_to(source_dir)
    target_file = target_dir / relative_path
    target_file.parent.mkdir(parents=True, exist_ok=True)

    print(f"🔄 Traduction de : {relative_path}")
    with md_file.open(encoding="utf-8") as f:
        content = f.read()

    translated_content = translate_markdown(content)

    with target_file.open("w", encoding="utf-8") as f:
        f.write(translated_content)

    print(f"✅ {relative_path} traduit avec succès.")
