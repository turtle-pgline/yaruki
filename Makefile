HOST = 255.255.255.255
USER = isucon

.PHONY: apply
apply:
	@./bin/itamae ssh -u ${USER} -h ${HOST} roles/default.rb

.PHONY: check
check:
	@./bin/itamae ssh --dry-run -u ${USER} -h ${HOST} roles/default.rb
