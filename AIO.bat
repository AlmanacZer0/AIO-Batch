@echo off

:menu
cls
echo AllInOne - AlmanacZer0
echo.
echo --------------------------------
	echo 1. Ping - Comprobar conectividad.
	echo 2. Gestion de usuarios y grupos.
	echo 3. Gestión de red.	
	echo.
	echo 0. Salir
echo --------------------------------
echo Que quieres hacer?
	set /p prog_1=">"
	goto %prog_1%
:0
	exit
:1
cls
	echo -------------------------------
	echo Ping - Comprobar conectividad
	echo -------------------------------
	echo.
	echo A que ip o web conectar?
	set /p ping_ip=">"
	echo.
	echo Cuantos paquetes quieres enviar?
	set /p ping_n=">"
	echo.
	echo Como de grandes quieres los paquetes?
	set /p ping_l=">"
	echo.
	ping %ping_ip% -n %ping_n% -l %ping_l% 
	pause
goto menu
:2
cls
	echo ------------------------------
	echo Gestion de usuarios y grupos
	echo ------------------------------
	echo.
	echo Que quieres hacer?
	echo 1. Gestionar usuarios
	echo 2. Gestionar grupos
	echo 3. Mover usuarios
	echo.
	echo 0. Atras
	echo ------------------------------
	echo.
	set /p Prog_2=">"
	goto 2.%Prog_2%
		:2.1
		cls
			echo -----------------------------------
			echo Gestion de usuarios
			echo.
			echo Que quieres hacer?
			echo 1. Agregar usuarios
			echo 2. Borrar usuarios
			echo 3. Comprobar todos los usuarios
			echo 4. Comprobar un usuario
			echo.
			echo 0. Atras
			echo -----------------------------------

			echo.
			set /p Prog_2.1=">"
			goto 2.1.%Prog_2.1%
				:2.1.1
				cls
					echo -----------------------------------
					echo Agregar usuario
					echo -----------------------------------
					echo Nombre del usuario?
					echo.
					set /p UsrAdd=">"
					net user %UsrAdd% * /add
					pause
					goto 2.1
				:2.1.2
				cls
					echo -----------------------------------
					echo Eliminar usuario
					echo ----------------------------
					net user
					echo ----------------------------
					echo.
					echo Usuario a eliminar?
					echo.
					set /p UsrDel=">"
					net user %UsrDel% /del
					pause
					goto 2.1
				:2.1.3
					net user
					pause
					goto 2.1	
				:2.1.4
				cls
					echo -----------------------------------
					echo Comprobar un solo usuario
					echo -----------------------------------
					net user
					echo -----------------------------------
					echo Nombre del usuario?
					set /p UsrLkUp=">"
					net user %UsrLkUp%
					pause
					goto 2.1
				:2.1.0
					goto 2
		:2.2
		cls
			echo -----------------------------------
			echo Gestion de grupos
			echo -----------------------------------
			echo.
			echo Que quieres hacer?
			echo.
			echo 1. Crear grupo
			echo 2. Eliminar grupo
			echo 3. Comprobar todos los grupos
			echo 4. Comprobar un grupo
			echo.
			echo 0. Atras
			echo -----------------------------------
			echo.
			set /p prog_2.2=">"
			goto 2.2.%prog_2.2%
			:2.2.1
			cls
				echo -----------------------------------
				echo Crear grupo
				echo -----------------------------------
				echo Nombre del grupo?
				echo.
				set /p GrpAdd=">"
				net localgroup %GrpAdd% /add
				pause
				goto 2.2
			:2.2.2
			cls
				echo -----------------------------------
				echo Eliminar grupo
				echo ---------------------------------
				net localgroup
				echo ---------------------------------
				echo Nombre del grupo?
				echo.
				set /p GrpDel=">"
				net localgroup %GrpDel% /del
				pause
				goto 2.2
			:2.2.3
				net localgroup
				pause
				goto 2.2
			:2.2.4
			cls
				echo -----------------------------------
				echo Comprobar un grupo
				echo -----------------------------------
				net localgroup
				echo -----------------------------------
				echo Nombre del grupo?
				set /p GrpLkUp=">"
				net localgroup %GrpLkUp%
				pause
				goto 2.2
			:2.2.0
				goto 2
		:2.3
		cls
			echo --------------------------------
			echo Mover usuarios
			echo --------------------------------
			net user
			echo Nombre del usuario?
			set /p MvUsr=">"
			cls
			net localgroup
			echo Nombre del grupo? [Usuario seleccionado: %MvUsr%]
			set /p MvGrp=">"
			echo.
			net localgroup %MvGrp% %MvUsr% /add
			echo ------------------------------------------
			echo Usuario %MvUsr% agregado al grupo %MvGrp%
			echo ------------------------------------------
			pause
			goto 2

		:2.0
			goto menu
	:3
	echo ----------------------
	echo Gestión de redes
	echo ----------------------
	echo 1. Cambio de ip [Estatica]
	echo 2. Cambio de DNS
	echo 3. Cambio de puerta de enlace.
	echo.
	echo 0. Atras
	echo-----------------------
	echo.
	set /p Prog_3=">"
	goto 3.%Prog_3%
		:3.1
			cls
			netsh interface ipv4 show config
			echo -------------------------
			echo.
			echo Interfaz a cambiar?
			set /p IntChoice=">"
			echo.
			echo IP a utilizar?
			set /p IpChoice=">"
			echo.
			echo Mascara de subred a utilizar?
			set /p SbNtChoice=">"
			echo.
			netsh interface ipv4 setaddress name="%IntChoice%" static %IpChoice% %SbNtChoice%
			echo Configuración de IP y mascara de red cambiada
			pause
			goto 3
		:3.2
			cls
			echo NADA
			goto 3
		:3.3
			cls
			echo NADA
			goto 3

