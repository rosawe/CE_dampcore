subroutine ic_trajectory (t, posx, posy, posz, velx, vely, velz)

	use Simulation_data, ONLY : sim_objMass, sim_ptMass, sim_periDist, sim_periTime, sim_tRelax, &
	                            sim_orbEcc, sim_xCenter, sim_yCenter, sim_zCenter

	double precision, dimension(6) :: obvec, ptvec
	double precision, intent(IN) :: t
	double precision, intent(INOUT) :: posx, posy, posz, velx, vely, velz

    ptvec  = 0.d0
    obvec  = 0.d0

    call calc_orbit(t, sim_objMass, sim_ptMass, sim_periDist, sim_periTime, &
                    sim_orbEcc, obvec, ptvec)
    ptvec = ptvec-obvec

	posx = ptvec(1) + sim_xCenter
	posy = ptvec(2) + sim_yCenter
	posz = ptvec(3) + sim_zCenter
	velx = ptvec(4)
	vely = ptvec(5)
	velz = ptvec(6)


	return
end subroutine ic_trajectory
