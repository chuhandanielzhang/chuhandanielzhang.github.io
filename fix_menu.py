import os
import re

directory = '/Users/daniel/Desktop/phd/website'
for filename in os.listdir(directory):
    if filename.endswith('.html'):
        filepath = os.path.join(directory, filename)
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Fix the missing newline issue from the previous script
        content = content.replace('</a></li>                    <li><a href="research.html"', '</a></li>\n                    <li><a href="research.html"')
        
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(content)
        print(f"Fixed {filename}")
