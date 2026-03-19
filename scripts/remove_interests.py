import os
import glob

html_files = glob.glob('/Users/daniel/Desktop/CURSOR/phd/website/*.html')

for file_path in html_files:
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We want to comment out the interests link
    target_str = '<li><a href="interests.html" class="sidebar-link'
    
    if target_str in content and '<!-- <li><a href="interests.html"' not in content:
        # Find the start of the line containing the target string
        lines = content.split('\n')
        for i, line in enumerate(lines):
            if target_str in line:
                # Comment out this line
                lines[i] = line.replace('<li>', '<!-- <li>').replace('</li>', '</li> -->')
                break
                
        new_content = '\n'.join(lines)
        
        with open(file_path, 'w', encoding='utf-8') as f:
            f.write(new_content)
        print(f"Updated {os.path.basename(file_path)}")
