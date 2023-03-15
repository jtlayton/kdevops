export KDEVOPS_HOSTS_TEMPLATE := nfstest.j2

NFSTEST_GIT:=$(subst ",,$(CONFIG_NFSTEST_GIT))

NFSTEST_ARGS += nfstest_git=$(NFSTEST_GIT)
WORKFLOW_ARGS += $(NFSTEST_ARGS)

# The default is our workflow does not have kernel-ci enabled
NFSTEST_KERNEL_CI_LOOP := false
NFSTEST_KERNEL_CI_LOOP_KOTD := false

# If kdevops was configured to enable kernel-ci we define our scripts
ifeq (y,$(CONFIG_KERNEL_CI))
NFSTEST_KERNEL_CI_LOOP      := scripts/workflows/nfstest/run_kernel_ci.sh
NFSTEST_KERNEL_CI_LOOP_KOTD := scripts/workflows/nfstest/run_kernel_ci_kotd.sh
endif # CONFIG_KERNEL_CI

# Makefile for nfstest targets
nfstest:
	$(Q)ansible-playbook -f 30 -i hosts playbooks/nfstest.yml --skip-tags run_tests,copy_results

nfstest-baseline:
	$(Q)ansible-playbook -f 30 -i hosts -l baseline playbooks/nfstest.yml --tags vars,first_run,reset --extra-vars=@./extra_vars.yaml
	$(Q)ansible-playbook -f 30 -i hosts -l baseline playbooks/nfstest.yml --tags vars,run_tests,copy_results --extra-vars=@./extra_vars.yaml

# Once you know the baseline works, you may want to run the baseline in a loop
# up to the number of times you define. We define this goal in kdevops as
# the CONFIG_KERNEL_CI_STEADY_STATE_GOAL.
nfstest-baseline-loop:
	$(Q)$(NFSTEST_KERNEL_CI_LOOP) baseline

# The kdevops kernel-ci target will try to upgrade your kernel to the latest
# and then run the baseline-loop.
nfstest-baseline-kernelci:
	$(Q)$(NFSTEST_KERNEL_CI_LOOP_KOTD) baseline

# Below are the corresponding dev targets
nfstest-dev-baseline:
	$(Q)ansible-playbook -f 30 -i hosts -l dev playbooks/nfstest.yml --tags vars,first_run,reset --extra-vars=@./extra_vars.yaml
	$(Q)ansible-playbook -f 30 -i hosts -l dev playbooks/nfstest.yml --tags vars,run_tests,copy_results --extra-vars=@./extra_vars.yaml

nfstest-dev-loop:
	$(Q)$(NFSTEST_KERNEL_CI_LOOP) dev

nfstest-dev-kernelci:
	$(Q)$(NFSTEST_KERNEL_CI_LOOP_KOTD) dev

nfstest-dev-reset:
	$(Q)ansible-playbook -f 30 -i hosts -l dev playbooks/nfstest.yml --tags vars,reset --extra-vars=@./extra_vars.yaml

nfstest-help-menu:
	@echo "nfstest options:"
	@echo "nfstest                             - Git clone nfstest, build and install it"
	@echo "nfstest-{baseline,dev}              - Run the nfstest test on baseline or dev hosts and collect results"
	@echo "nfstest-{baseline,dev}-loop"        - Run nfstest in a loop until error or steady state
	@echo "nfstest-{baseline,dev}-kernelci     - Run nfstest kernel-ci loop"
	@echo ""

HELP_TARGETS += nfstest-help-menu
