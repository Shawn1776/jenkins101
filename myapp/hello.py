import fire
def hello( name="World" ):
    return "Hello {}!".format( name )

if __name__ == '__main__':
    fire.Fire(hello)