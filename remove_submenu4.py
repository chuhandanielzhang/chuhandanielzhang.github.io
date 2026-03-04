import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Remove any remaining sidebar-sublink elements and their parent li tags
    content = re.sub(r'\s*<li>\s*<a href="[^"]*" class="sidebar-sublink[^"]*">.*?</a>\s*</li>', '', content, flags=re.DOTALL)
    
    # Also remove any empty ul tags that might be left over
    content = re.sub(r'\s*<ul class="sidebar-submenu">\s*</ul>', '', content, flags=re.DOTALL)
    
    with open(filepath, 'w') as f:
        f.write(content)
    print(f"Updated {filepath}")

print("Done!")
