HOST = 255.255.255.255

.PHONY: apply
apply:
	@./bin/itamae ssh -h ${HOST} roles/default.rb

.PHONY: check
check:
	@./bin/itamae ssh --dry-run -h ${HOST} roles/default.rb
