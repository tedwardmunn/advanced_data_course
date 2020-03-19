



import pandas as pd

def getnetworksoncompanypages(nodefile, edgefile, outputnode, outputedge):
    company_id = {}
    dataset = pd.read_csv(nodefile)
    with open(outputnode, 'w',encoding="utf-8") as outputf:
        for i in range(len(dataset)):
            id, facebookid, pagename, pagetype = dataset.iloc[i, 0],dataset.iloc[i, 1],dataset.iloc[i, 2],dataset.iloc[i, 3]
            if pagetype == "company":
                info = ','.join([str(facebookid), pagename])
                new_id = str(len(company_id))
                company_id[str(id)] = new_id
                outputf.write(new_id + ',' + info + '\n')


    with open(edgefile, "r") as inputedgef, open(outputedge, 'w') as outputedgef:
        inputedgef.readline()
        for line in inputedgef:
            source, target = line.strip().split(',')
            if source in company_id.keys() and target in company_id.keys():
                new_source = company_id[source]
                new_target = company_id[target]
                outputedgef.write(new_source+','+new_target+'\n')

if __name__ == '__main__':
    root = "C:\\Users\\sophi\\PycharmProjects\\Assignmenttest\\"
    nodefile = root+"musae_facebook_target.csv"
    edgefile = root+"musae_facebook_edges.csv"
    outputnode = root+"companyinfo.csv"
    outputedge =root+"companylink.csv"
    getnetworksoncompanypages(nodefile, edgefile, outputnode, outputedge)