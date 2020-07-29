subroutine damping (t, t_final, prefactor)

	double precision, intent(IN) :: t, t_final
	double precision, intent(INOUT) :: prefactor

	prefactor = t/t_final


	return
end subroutine damping