pi = 3.14159265
NM1 = N-1
ND2 = N/2
M = log(N)/log(2) // for N=256, M=8
j=ND2

for i = 1; i< N-2; i++
	if i>=j then
		k=ND2
	else
		tr = re_x[j]
		ti = im_X[j]
		re_x[j]=re_x[i]
		im_x[j]=im_x[i]
		re_x[i]=tr
		im_x[i]=ti
		k=ND2
	end if
	
	if k > j then
		j = j+k
		next loop
		
	else
		j = j-k
		k = k/2
		return to the same if
		
end for

for L = 1 to M(8)
	LE = 2^L
	LE2= LE/2
	UR = 1
	UI = 0
	SR = cos(pi/LE2)
	SI = -sin(pi/LE2)
	for j = 1 to LE2
		jm1 = j-1
		for i = jm1 to NM1;i+LE
			ip = i +LE2
			TR = re_x[ip]*UR - im_x[ip]*UI
			TI = re_x[ip]*UI + im_x[ip]*UR
			re_x[ip] = re_x[i] - TR
			im_x[ip] = im_x[i] - TI
			re_x[i] = re_x[i] + TR
			im_x[i] = im_x[i] + TI
		 end for
		
		TR = UR
		UR = TR*SR - UI*SI
		UI = TR*SI + UI*SR
		
	end for
end for
		
