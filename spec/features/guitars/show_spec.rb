#[ ] done

#User Story 4, Child Show (x2)

#As a visitor
#When I visit '/child_table_name/:id'
#Then I see the child with that id including the child's attributes:

#[ ] done

#User Story 14, Child Update (x2)

#As a visitor
#When I visit a Child Show page
#Then I see a link to update that Child "Update Child"
#When I click the link
#I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
#When I click the button to submit the form "Update Child"
#Then a `PATCH` request is sent to '/child_table_name/:id',
#the child's data is updated,
#and I am redirected to the Child Show page where I see the Child's updated information

#[ ] done

#User Story 20, Child Delete (x2)

#As a visitor
#When I visit a child show page
#Then I see a link to delete the child "Delete Child"
#When I click the link
#Then a 'DELETE' request is sent to '/child_table_name/:id',
#the child is deleted,
#and I am redirected to the child index page where I no longer see this child
