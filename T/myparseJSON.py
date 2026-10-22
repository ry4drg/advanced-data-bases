import json

with open('data-description.json') as f:
    i = 0
    for name, info in json.load(f)['properties'].items():
        attrib_name = str(name)
        attrib_domain = info['type']
        #get the dictionary corresponding to x-labels. Return empty dictionary if label not found.
        attribute_dict = info.get('x-labels',{})

        print("Information on attribute ", i)
        print ("\t", name)
        print ("\t", info['type'])
        print(attribute_dict)

        for (x,y) in attribute_dict.items(): 
            print ("\t\t", x, y)

        i = i + 1
        print("----------------------------------------------------------------------")
