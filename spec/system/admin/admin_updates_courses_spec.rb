require 'rails_helper'

describe 'admin updates courses' do
  it 'successfully' do
    instructor = Instructor.create!(name: 'Fulano Sicrano',
                                    email: 'fulano@codeplay.com.br')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', instructor: instructor)
    Instructor.create!(name: 'Jane Doe', email: 'jane@codeplay.com.br')

    user_login
    visit admin_course_path(course)
    click_on 'Editar'
    fill_in 'Nome', with: 'Ruby on Rails'
    fill_in 'Descrição', with: 'Um curso de RoR'
    fill_in 'Código', with: 'RUBYONRAILS'
    fill_in 'Preço', with: '30'
    fill_in 'Data limite de matrícula', with: Date.current.strftime('%d/%m/%Y')
    select 'Jane Doe - jane@codeplay.com.br', from: 'Instrutor(a)'
    click_on 'Salvar'

    expect(page).to have_text('Ruby on Rails')
    expect(page).to have_text('Um curso de RoR')
    expect(page).to have_text('Jane Doe')
    expect(page).to have_text('RUBYONRAILS')
    expect(page).to have_text('R$ 30,00')
    expect(page).to have_text(Date.current.strftime('%d/%m/%Y'))
    expect(page).to have_text('Curso atualizado com sucesso')
  end

  it 'must be looged in to update course' do
    instructor = Instructor.create!(name: 'Fulano Sicrano',
                                    email: 'fulano@codeplay.com.br')
    course = Course.create!(name: 'Ruby', description: 'Um curso de Ruby',
                            code: 'RUBYBASIC', price: 10,
                            enrollment_deadline: '22/12/2033', instructor: instructor)

    visit edit_admin_course_path(course)

    expect(current_path).to eq(new_user_session_path)
  end
end
