import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Use regex to find and remove the <ul class="sidebar-submenu"> block by matching opening and closing tags
    # This handles nested tags by matching up to the first </ul> that closes the sidebar-submenu
    
    # A simpler approach: just remove everything between <ul class="sidebar-submenu"> and </ul>
    # We'll do this iteratively to handle nested ones
    while '<ul class="sidebar-submenu">' in content:
        start_idx = content.find('<ul class="sidebar-submenu">')
        
        # Find the matching closing </ul>
        ul_count = 0
        end_idx = -1
        
        # Search from start_idx
        search_str = content[start_idx:]
        
        pos = 0
        while pos < len(search_str):
            if search_str.startswith('<ul', pos):
                ul_count += 1
            elif search_str.startswith('</ul>', pos):
                ul_count -= 1
                if ul_count == 0:
                    end_idx = start_idx + pos + 5
                    break
            pos += 1
            
        if end_idx != -1:
            content = content[:start_idx] + content[end_idx:]
        else:
            # Fallback if parsing fails
            break
            
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
