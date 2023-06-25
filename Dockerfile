FROM nvcr.io/nvidia/pytorch:23.04-py3

RUN pip install --upgrade pip
# install jax
RUN pip install --upgrade "jax[cuda12_local]" -f https://storage.googleapis.com/jax-releases/jax_cuda_releases.html

# install python dependnecies
COPY requirements.txt ./
RUN pip install -r requirements.txt && rm ./requirements.txt

RUN apt-get update

# install locale
RUN apt-get install -y language-pack-en

# install ripgrep
RUN apt-get install ripgrep

# install nvim
RUN apt-get install fuse libfuse2
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage
RUN ./nvim.appimage --appimage-extract
RUN ./squashfs-root/AppRun --version
RUN mv squashfs-root /
RUN ln -s /squashfs-root/AppRun /usr/bin/nvim

# install nvchad
# RUN git clone https://github.com/NvChad/NvChad ~/.config/nvim
# RUN cd ~/.config; rm -rf nvim
RUN git clone https://github.com/litcoderr/nvim_config.git ~/.config/nvim

# alias nvim
RUN echo 'alias vim=nvim' >> ~/.bashrc
