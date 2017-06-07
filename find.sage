####################################################################
# 																   #
#	This code generates all distinct combinatorial types of 	   #
#	(0,1,a)-polytopes with k vertices							   #
#																   #
####################################################################
#
#### declare number of vertices ####
k=16
#
#### choose starting place ####				
start=0
#
#### declare a value ####
a=2.1
#
coord = [[0,0,0],[1,0,0],[0,1,0],[1,1,0],[a,0,0],[0,a,0],[a,a,0],[1,a,0],[a,1,0],[0,0,1],[1,0,1],[0,1,1],[1,1,1],[a,0,1],[0,a,1],[a,a,1],[1,a,1],[a,1,1],[0,0,a],[1,0,a],[0,1,a],[1,1,a],[a,0,a],[0,a,a],[a,a,a],[1,a,a],[a,1,a]]
#
#### create list of previously-found combinatorial types ####
#
polys = []
with open('012_1polys/vert'+str(k)+'/act_vert'+str(k)+'.txt','r') as filer:
    for line in filer:
        l = eval(line)
	vvert = []
	for i in l:
	    vvert.append(coord[i])
        facel = Polyhedron(vertices = vvert).face_lattice()
        polys.insert(0, facel)
#
#### generate new potential polytopes, check for dimension, number of vertices, and newness ####
#
c=0
for comb in Combinations(27,k):
    c+=1
    if c < start:
        continue
    if c>= start+15000:
		break
    if c%100==99:
	with open('012_1polys/vert'+str(k)+'/progress'+str(k)+'.txt','w') as filew:
            filew.write(str(c))
    vert = []
    for i in comb:
        vert.append(coord[i])
    p= Polyhedron(vertices = vert)
    new=True
    if p.dim()!=3:
        continue
    if p.f_vector()[1]!=len(vert):
        continue
    fl=p.face_lattice()
    for pol in polys:
        if fl.is_isomorphic(pol):
            new=False
            break
    if new==True:
        polys.insert(0,fl)
        with open('012_1polys/vert'+str(k)+'/act_vert'+str(k)+'.txt','a') as filew:
            filew.write(str(comb))
            filew.write('\n')
quit()
