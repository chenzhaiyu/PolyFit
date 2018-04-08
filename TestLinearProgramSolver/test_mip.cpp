// TestLinearProgramSolver.cpp : Defines the entry point for the console application.
//

#include "../math/linear_program.h"
#include "../math/linear_program_solver.h"


/*
Maximize
obj: x1 + 2 x2 + 3 x3 + x4
Subject To
	c1: - x1 +   x2 + x3 + 10 x4 <= 20
	c2:   x1 - 3 x2 + x3         <= 30
	c3:   x2            - 3.5 x4 = 0
Bounds
	0 <= x1 <= 40
	2 <= x4 <= 3
General
	x4 is integer

	Expected results: x0=40; x1=10.5; x2=19.5; x3=3
*/

int test_mip()
{
	typedef Bound<double>				Bound;
	typedef Variable<double>			Variable;
	typedef LinearExpression<double>	Objective;
	typedef LinearConstraint<double>	Constraint;
	typedef LinearProgram<double>		LinearProgram;

	LinearProgram program;
	Variable x1(Variable::CONTINUOUS);	x1.set_bound(0, 40);	program.add_variable(x1);
	Variable x2(Variable::CONTINUOUS);							program.add_variable(x2);
	Variable x3(Variable::CONTINUOUS);							program.add_variable(x3);
	Variable x4(Variable::INTEGER);		x4.set_bound(2, 3);		program.add_variable(x4);

	double coeff = -1; // for maximize
	Objective obj;
	obj.add_coefficient(0, coeff * 1.0);
	obj.add_coefficient(1, coeff * 2.0);
	obj.add_coefficient(2, coeff * 3.0);
	obj.add_coefficient(3, coeff * 1.0);
	program.set_objective(obj);

	Constraint c1;	//  - x1 +   x2 + x3 + 10 x4 <= 20
	c1.add_coefficient(0, -1);
	c1.add_coefficient(1, 1);
	c1.add_coefficient(2, 1);
	c1.add_coefficient(3, 10);
	c1.set_bound(Bound::UPPER, 20);
	program.add_constraint(c1);

	Constraint c2;	//   x1 - 3 x2 + x3         <= 30
	c2.add_coefficient(0, 1);
	c2.add_coefficient(1, -3);
	c2.add_coefficient(2, 1);
	c2.set_bound(Bound::UPPER, 30);
	program.add_constraint(c2);

	Constraint c3;	//      x2            - 3.5 x4 = 0
	c3.add_coefficient(1, 1);
	c3.add_coefficient(3, -3.5);
	c3.set_bound(Bound::FIXED, 0);
	program.add_constraint(c3);

	std::cout << "-----------------------------" << std::endl;
	std::cout << "solving MIP problem..." << std::endl;
	LinearProgramSolver solver;
	LinearProgramSolver::LP_Solver s;

	std::cout << "	- using Gurobi solver" << std::endl;
	s = LinearProgramSolver::GUROBI;
	//LinearProgramSolver::LP_Solver s = LinearProgramSolver::LPSOLVE;
	if (solver.solve(&program, s)) {
		std::cout << "		Expected results: x0=40; x1=10.5; x2=19.5; x3=3;" << std::endl;

		const std::vector<double>& result = solver.get_result();
		std::cout << "		LPSolver results: ";
		for (std::size_t i=0; i<result.size(); ++i) {
			std::cout << "x" << i + 1 << "=" << result[i] << "; ";
		}
		std::cout << std::endl;
	}

	std::cout << "	- using LP_SOLVE solver" << std::endl;
	s = LinearProgramSolver::LPSOLVE;
	if (solver.solve(&program, s)) {
		std::cout << "		Expected results: x0=40; x1=10.5; x2=19.5; x3=3;" << std::endl;

		const std::vector<double>& result = solver.get_result();
		std::cout << "		LPSolver results: ";
		for (std::size_t i = 0; i < result.size(); ++i) {
			std::cout << "x" << i + 1 << "=" << result[i] << "; ";
		}
		std::cout << std::endl;
	}

	return 0;
}

