import os
import re

directory = '/Users/daniel/Desktop/phd/website'
for filename in os.listdir(directory):
    if filename.endswith('.html'):
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Capture the research <li> block including leading whitespace
        research_pattern = re.compile(r'([ \t]*<li>\s*<a href="research\.html".*?</li>)', re.DOTALL)
        research_match = research_pattern.search(content)
        
        if not research_match:
            continue
            
        research_str = research_match.group(1)
        
        # Remove the research block from the content
        content_without_research = content.replace(research_str, '')
        
        # Find the awards <li> block
        awards_pattern = re.compile(r'(<li>\s*<a href="awards\.html".*?</li>)', re.DOTALL)
        
        # Insert the research block right after the awards block
        # We need to use a function for replacement to avoid issues with backreferences if research_str contains \
        def repl(m):
            return m.group(1) + research_str
            
        new_content = awards_pattern.sub(repl, content_without_research)
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {filename}")
