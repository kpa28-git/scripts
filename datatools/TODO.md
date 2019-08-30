* Don't hardcode the drive desitnations, come up with a different solution
	* Separate scripts for type A and type B drives
	* Global backup script runs scripts on each mounted external drive depending on type without user input
		* Type derived from drive label or file at drive root
* Use udev rules for increased automation
