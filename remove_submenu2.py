import glob
import re

files = glob.glob('/Users/daniel/Desktop/phd/website/*.html')

for filepath in files:
    with open(filepath, 'r') as f:
        content = f.read()
    
    # Use regex to remove <ul class="sidebar-submenu">...</ul> blocks
    # Need to handle nested lists properly
    pattern = r'\s*<ul class="sidebar-submenu">.*?</ul>'
    new_content = re.sub(pattern, '', content, flags=re.DOTALL)
    
    # Run it again to catch any remaining ones (since they might be nested)
    new_content = re.sub(pattern, '', new_content, flags=re.DOTALL)
    new_content = re.sub(pattern, '', new_content, flags=re.DOTALL)
    
    if new_content != content:
        with open(filepath, 'w') as f:
            f.write(new_content)
        print(f"Updated {filepath}")

print("Done!")
