#[ ] done

#User Story 2, Parent Show (x2)

#As a visitor
#When I visit '/parents/:id'
#Then I see the parent with that id including the parent's attributes:
#- data from each column that is on the parent table

#[ ] done

#User Story 7, Parent Child Count (x2)

#As a visitor
#When I visit a parent's show page
#I see a count of the number of children associated with this parent

#[ ] done

#User Story 7, Parent Child Count (x2)

#As a visitor
#When I visit a parent's show page
#I see a count of the number of children associated with this parent

#[ ] done

#User Story 10, Parent Child Index Link

#As a visitor
#When I visit a parent show page ('/parents/:id')
#Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

#[ ] done

#User Story 12, Parent Update (x2)

#As a visitor
#When I visit a parent show page
#Then I see a link to update the parent "Update Parent"
#When I click the link "Update Parent"
#Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
#When I fill out the form with updated information
#And I click the button to submit the form
#Then a `PATCH` request is sent to '/parents/:id',
#the parent's info is updated,
#and I am redirected to the Parent's Show page where I see the parent's updated info

#[ ] done

#User Story 19, Parent Delete (x2)

#As a visitor
#When I visit a parent show page
#Then I see a link to delete the parent
#When I click the link "Delete Parent"
#Then a 'DELETE' request is sent to '/parents/:id',
#the parent is deleted, and all child records are deleted
#and I am redirected to the parent index page where I no longer see this parent
