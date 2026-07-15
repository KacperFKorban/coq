Set Printing Goal On Error.

Goal forall A : Type, A -> A.
Proof.
  intros A x.
  exact A.

Unset Printing Goal On Error.
  exact A.

Abort.

Check missing_identifier.
