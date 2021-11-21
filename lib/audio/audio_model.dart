class AudioModel {
  String artist;
  String imageUrl;
  String audioPath;

  AudioModel(this.artist, this.imageUrl, this.audioPath);
}

final audioData = [
  AudioModel(
    'Artist A',
    'https://images.unsplash.com/photo-1527735095040-147bffb4cede?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'test/file_example_MP3_2MG.mp3',
  ),
  AudioModel(
    'Artist B',
    'https://images.unsplash.com/photo-1526218626217-dc65a29bb444?ixid,=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'test/file_example_MP3_5MG.mp3',
  ),
  AudioModel(
    'Artist C',
    'https://images.unsplash.com/photo-1535712593684-0efd191312bb?ixid,=MnwxMjA3fDB8MHxzZWFyY2h8NHx8c2luZ2VyfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
    'test/file_example_MP3_700KB.mp3',
  ),
];
