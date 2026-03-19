import os
import glob

html_files = glob.glob('/Users/daniel/Desktop/CURSOR/phd/website/*.html')

for file_path in html_files:
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    if '<li><a href="talks.html" class="sidebar-link"' in content:
        continue
        
    # Find the publications link and insert talks after it
    pub_link = '<li><a href="publications.html" class="sidebar-link'
    
    if pub_link in content:
        # We need to handle both active and inactive states
        parts = content.split('<li><a href="publications.html" class="sidebar-link')
        
        if len(parts) > 1:
            # Reconstruct the file with the new link
            new_content = parts[0] + '<li><a href="publications.html" class="sidebar-link'
            
            # Find the end of the publications li tag
            rest = parts[1]
            end_li_idx = rest.find('</li>') + 5
            
            new_content += rest[:end_li_idx]
            new_content += '\n                    <li><a href="talks.html" class="sidebar-link"><span class="icon">🗣️</span>Talks</a></li>'
            new_content += rest[end_li_idx:]
            
            with open(file_path, 'w', encoding='utf-8') as f:
                f.write(new_content)
            print(f"Updated {os.path.basename(file_path)}")
