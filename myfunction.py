mySentence = 'I love my dog, '

dog_list = ['mabel','charles','sawyer','murphy','ula']

def dog_function():
    for i in dog_list:
        print('{} {}'.format(mySentence,i))

x = dog_list.count('mabel')
print(x)

dog_list.sort()

dog_function()
