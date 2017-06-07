k=8
a=4
coord = [[0,0,0],[1,0,0],[0,1,0],[1,1,0],[a,0,0],[0,a,0],[a,a,0],[1,a,0],[a,1,0],[0,0,1],[1,0,1],[0,1,1],[1,1,1],[a,0,1],[0,a,1],[a,a,1],[1,a,1],[a,1,1],[0,0,a],[1,0,a],[0,1,a],[1,1,a],[a,0,a],[0,a,a],[a,a,a],[1,a,a],[a,1,a]]
polys = []
with open('storage/01a_polys/014polys/act_vert'+str(k)+'.txt','r') as filer:
	for line in filer:
		vert_coord = eval(line)
		vert_in_facet = []
		for vert in vert_coord:
			for i in range(27):
				if vert == coord[i]:
					vert_in_facet.append(i)
		polys.append(vert_in_facet)		
with open('storage/01a_polys/014polys/act_vert'+str(k)+'.txt','w') as filew:
	for p in polys:		    
		filew.write(str(p))
		filew.write('\n')
